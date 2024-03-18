from django.contrib.auth.models import User
from rest_framework import serializers

class UserSignupSerializer(serializers.Serializer):
    username = serializers.CharField(min_length=4)
    email = serializers.EmailField()
    password = serializers.CharField(write_only=True,min_length=10)

class UserLoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField(write_only=True)


class UserLogoutSerializer(serializers.Serializer):
    username = serializers.CharField()

class PasswordResetSerializer(serializers.Serializer):
    username = serializers.CharField()
    new_password = serializers.CharField(min_length=10)



    
    
