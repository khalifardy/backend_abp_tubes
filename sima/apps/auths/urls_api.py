from django.urls import re_path
from .api_views import Login, Signup, LogoutView

urlpatterns = [
    re_path(r'^login/$', Login.as_view(), name='Login'),
    re_path(r'^signup/$', Signup.as_view(), name='Signup'),
    re_path(r'^logout/$', LogoutView.as_view(), name='Logout')
]
