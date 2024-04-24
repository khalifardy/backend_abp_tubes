from rest_framework_simplejwt.state import token_backend
from rest_framework.permissions import BasePermission
from django.core.cache import cache

import json


class IsTokenValid(BasePermission):
    """
    Kelas ini digunakan untuk memeriksa kevalidan token pengguna.

    Metode:
    - has_permission: Memeriksa apakah token pengguna valid.

    Atribut:
    - request: Objek permintaan HTTP.
    - view: Objek view yang sedang diproses.
    """

    def has_permission(self, request, view):
        """
        Memeriksa apakah token pengguna valid.

        Parameter:
        - request: Objek permintaan HTTP.
        - view: Objek view yang sedang diproses.

        Return:
        - is_allowed_user: Boolean yang menunjukkan apakah token pengguna valid.
        """
        try:
            try:
                token = request.auth.decode("utf-8")
            except Exception as e:
                token = request.META['HTTP_AUTHORIZATION']
                token = token.replace("Bearer ", "")

            if token is not None:
                is_blackListed = cache.get(('token-%s' % token))

                if is_blackListed:
                    is_allowed_user = False
                else:
                    is_allowed_user = True
        except Exception as e:
            print("verify_token_error :" + str(e))
            is_allowed_user = False
        return is_allowed_user