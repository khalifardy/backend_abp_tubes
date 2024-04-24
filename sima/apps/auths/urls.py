from django.urls import re_path
from .views import login,signup


urlpatterns = [
    re_path(r'^login/$',login, name='login'),
    re_path(r'^signup/$',signup, name='signup')
]
