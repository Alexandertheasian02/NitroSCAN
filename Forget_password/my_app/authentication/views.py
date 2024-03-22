# from django.shortcuts import render
# Create your views here.

from base64 import urlsafe_b64encode
from rest_framework import generics, status, viewsets, response
from django.contrib.auth.models import User
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import force_bytes

from . import serializer

class PasswordReset(generics.GenericAPIView):

    serializer_class = serializer.EmailSerializer

    def post (self, request):

        serializers = self.serializer_class(data = request.data)
        serializers.is_valid(raise_exception=True)
        email = serializers.data["email"]
        user = User.objects.filter(email=email).first()

        if user:
            encoded_pk = urlsafe_b64encode(force_bytes(user.pk))
            token = PasswordResetTokenGenerator().make_token(user)