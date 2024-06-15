from rest_framework import serializers
from .models import Author, Publisher, Book, Review

class BookSerializers(serializers.ModelSerializer):
    
    category = serializers.SerializerMethodField()
    sub_category = serializers.SerializerMethodField()
    author = serializers.SerializerMethodField()
    publisher = serializers.SerializerMethodField()
    
    class Meta:
        model = Book
        fields = '__all__'
    
    def get_author(self, obj):
        return obj.author.name
    
    def get_publisher(self, obj):
        return obj.publisher.name
    
    def get_category(self, obj):
        return obj.get_category_display()

    def get_sub_category(self, obj):
        return obj.get_sub_category_display()


class ReviewSerializers(serializers.ModelSerializer):
    book = BookSerializers(read_only=True)
    class Meta:
        model = Review
        fields = '__all__'

class AuthorSerializers(serializers.ModelSerializer):
    class Meta:
        model = Author
        fields = '__all__'

class PublisherSerializers(serializers.ModelSerializer):
    class Meta:
        model = Publisher
        fields = '__all__'