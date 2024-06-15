from django.shortcuts import render
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.core.cache import cache
from django.contrib.auth.hashers import make_password
from django.db.models import Q
from django.core.cache import cache
from django.core.files.base import ContentFile

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from rest_framework_jwt.settings import api_settings
from rest_framework.pagination import PageNumberPagination
from rest_framework.generics import ListAPIView


from .models import Author, Publisher, Book, Review

from .serializers import BookSerializers, ReviewSerializers, AuthorSerializers, PublisherSerializers

from lib_util.lib_apps_main_page import book_kategori, book_sub_kategori
from authenticate import IsTokenValid

class BookPagination(PageNumberPagination):
    page_size = 10

class BookList(ListAPIView):
    serializer_class = BookSerializers
    permission_classes = (AllowAny,)
    pagination_class = BookPagination
    
    def get_queryset(self):
        queryset = Book.objects.all()
        page = self.request.query_params.get('page',None)
        search = self.request.query_params.get('search',None)

        if search:
            queryset = queryset.filter(
                Q(title__icontains=search) |
                Q(author__name__icontains=search) |
                Q(publisher__name__icontains=search) |
                Q(category__icontains=search) |
                Q(sub_category__icontains=search) |
                Q(code__icontains=search) |
                Q(isbn__icontains=search)
            )
        
        return queryset
    
    def post(self,request):
        id = request.data.get('id')
        
        try:
            book = Review.objects.get(book__id=id)
            return Response(ReviewSerializers(book).data, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)

class CrudBook(APIView):
    permission_classes = (IsTokenValid,)
    def get(self, request):
        id = request.query_params.get('id',None)
        if id:
            try:
                book = Book.objects.get(id=id)
                return Response(BookSerializers(book).data, status=status.HTTP_200_OK)
            except Exception as e:
                return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"msg":"buku tidak ditemukan"}, status=status.HTTP_400_BAD_REQUEST)

    def post(self, request):
        title = request.data.get('title')
        code = request.data.get('code')
        author = request.data.get('author')
        isbn = request.data.get('isbn')
        publisher = request.data.get('publisher')
        category = request.data.get('category')
        sub_category = request.data.get('sub_category')
        url_buku = request.FILES.get('buku')
        url_image = request.FILES.get('image',None)
        stok = request.data.get('stok',0)
        premium = request.data.get('premium',False)
        sinopsis = request.data.get('sinopsis',None)
        rating = int(request.data.get('rating',0))
        
        author = Author.objects.get(name=author)
        publisher = Publisher.objects.get(name=publisher)
        
        try:
            Book.objects.create(
                title=title,
                code=code,
                author=author,
                isbn=isbn,
                publisher=publisher,
                category=book_kategori(category.lower()),
                sub_category=book_sub_kategori(sub_category.lower()),
                url_buku=url_buku,
                url_image=url_image,
                stok=stok,
                premium=premium
            )
            
            book_id = Book.objects.get(code=code)
            Review.objects.create(book=book_id, review=sinopsis,rating=rating)
            return Response({"msg":"berhasil menambahkan buku"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)
    
    def put(self, request):
        id = request.data.get('id')
        title = request.data.get('title',None)
        code = request.data.get('code',None)
        author = request.data.get('author',None)
        isbn = request.data.get('isbn',None)
        publisher = request.data.get('publisher',None)
        category = request.data.get('category',None)
        sub_category = request.data.get('sub_category',None)
        url_buku = request.FILES.get('buku',None)
        url_image = request.FILES.get('image',None)
        stok = request.data.get('stok',None)
        premium = request.data.get('premium',None)
        sinopsis = request.data.get('sinopsis',None)
        rating = int(request.data.get('rating',0))
        
        
        try: 
            if author:
                author = Author.objects.get(name=author)
            if publisher:
                publisher = Publisher.objects.get(name=publisher)
        
            update_fields = {}
            if title:
                update_fields['title'] = title
            if code:
                update_fields['code'] = code
            if author:
                update_fields['author'] = Author.objects.get(name=author)
            if isbn:
                update_fields['isbn'] = isbn
            if publisher:
                update_fields['publisher'] = Publisher.objects.get(name=publisher)
            if category:
                update_fields['category'] = category
            if sub_category:
                update_fields['sub_category'] = sub_category
            if stok:
                update_fields['stok'] = stok
            if premium:
                update_fields['premium'] = premium
                
            if url_buku: 
                book = Book.objects.get(id=id)
                book.url_buku.save(url_buku.name, ContentFile(url_buku.read()))  # Save the new file

            if url_image:

                book = Book.objects.get(id=id)
                book.url_image.save(url_image.name, ContentFile(url_image.read()))  # Save the new file
            

            # Update the book
            Book.objects.filter(id=id).update(**update_fields)
            
            if sinopsis:
                book_id = Book.objects.get(id=id)
                Review.objects.filter(book=book_id).update(review=sinopsis)
            
            if rating:
                book_id = Book.objects.get(id=id)
                Review.objects.filter(book=book_id).update(rating=rating)
            return Response({"msg":"berhasil mengupdate buku"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request):
        id = request.data.get('id')
        try:
            Review.objects.get(book__id=id).delete()
            Book.objects.get(id=id).delete()
            
            return Response({"msg":"berhasil menghapus buku"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)   
         
        

class AuthorList(APIView):
    permission_classes = (AllowAny,)
    def get(self, request):
        author = Author.objects.all()
        return Response(AuthorSerializers(author, many=True).data, status=status.HTTP_200_OK)

class AuthorCrud(APIView):
    permission_classes = (IsTokenValid,)
    
    def get(self, request):
        id = request.query_params.get('id')
        try:
            author = Author.objects.get(id=id)
            return Response(AuthorSerializers(author).data, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)
    
    def post(self, request):
        name = request.data.get('name')
        code = request.data.get('code')
        try:
            Author.objects.create(name=name,code=code)
            return Response({"msg":"berhasil menambahkan author"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)
    

class PublisherList(APIView):
    permission_classes = (AllowAny,)
    def get(self, request):
        publisher = Publisher.objects.all()
        return Response(PublisherSerializers(publisher, many=True).data, status=status.HTTP_200_OK)   
        

class PublisherCrud(APIView):
    permission_classes = (IsTokenValid,)
    
    def get(self, request):
        id = request.query_params.get('id')
        try:
            publisher = Publisher.objects.get(id=id)
            return Response(PublisherSerializers(publisher).data, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)
    
    def post(self, request):
        name = request.data.get('name')
        address = request.data.get('address')
        city = request.data.get('city')
        country = request.data.get('country')
        website = request.data.get('website')
        contact = request.data.get('contact')
        
        try:
            Publisher.objects.create(name=name,address=address,city=city,country=country,website=website,contact=contact)
            return Response({"msg":"berhasil menambahkan publisher"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)

