# from django.shortcuts import render
# Create your views here.

from rest_framework import generics, status, viewsets, response
from django.contrib.auth.models import User
from . import serializer

class PasswordReset(generics.GenericAPIView):

    serializer_class = serializer.EmailSerializer

    def post (self, request):

        serializers = self.serializer_class(data = request.data)
        serializers.is_valid(raise_exception=True)
        email = serializers.data["email"]
        user = User.objects.filter(email=email).first()