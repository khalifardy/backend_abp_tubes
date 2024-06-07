from django.urls import re_path
from .api_views import BookList,CrudBook

urlpatterns = [
    re_path(r'^booklist/$', BookList.as_view(), name='booklist'),
    re_path(r'^bookcrud/$', CrudBook.as_view(), name='crudbook'),
]
