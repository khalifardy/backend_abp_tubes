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

from .serializers import BookSerializers, ReviewSerializers

from lib_util.lib_apps_main_page import book_kategori, book_sub_kategori
from authenticate import IsTokenValid

class BookPagination(PageNumberPagination):
    page_size = 2

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
        
        author = Author.objects.get(name=author)
        publisher = Publisher.objects.get(name=publisher)
        
        try:
            Book.objects.create(
                title=title,
                code=code,
                author=author,
                isbn=isbn,
                publisher=publisher,
                category=book_kategori(category),
                sub_category=book_sub_kategori(sub_category),
                url_buku=url_buku,
                url_image=url_image,
                stok=stok,
                premium=premium
            )
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
            return Response({"msg":"berhasil mengupdate buku"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request):
        id = request.data.get('id')
        try:
            Book.objects.get(id=id).delete()
            return Response({"msg":"berhasil menghapus buku"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"msg":str(e)}, status=status.HTTP_400_BAD_REQUEST)   
         
        