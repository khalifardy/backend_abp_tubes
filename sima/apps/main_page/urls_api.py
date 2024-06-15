from django.urls import re_path
from .api_views import BookList,CrudBook,AuthorList,AuthorCrud,PublisherCrud,PublisherList

urlpatterns = [
    re_path(r'^booklist/$', BookList.as_view(), name='booklist'),
    re_path(r'^bookcrud/$', CrudBook.as_view(), name='crudbook'),
    re_path(r'^bookcrud/$', CrudBook.as_view(), name='crudbook'),
    re_path(r'^authorlist/$', AuthorList.as_view(), name='authorlist'),
    re_path(r'^authorcrud/$', AuthorCrud.as_view(), name='authorcrud'),
    re_path(r'^publisherlist/$', PublisherList.as_view(), name='publisherlist'),
    re_path(r'^publishercrud/$', PublisherCrud.as_view(), name='publishercrud'),
]
