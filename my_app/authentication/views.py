from django.contrib.auth.models import User
from rest_framework import serializers
from rest_framework import status
from rest_framework.decorators import api_view
from django.db import IntegrityError
from rest_framework.response import Response
from django.contrib.auth import authenticate, login, logout

from .serializer import UserSignupSerializer, UserLoginSerializer, UserLogoutSerializer,PasswordResetSerializer

@api_view(['POST'])
def user_signup(request):
    if request.method == 'POST':
        data = request.data
        serializer = UserSignupSerializer(data=data)
        
        if serializer.is_valid():
            email = serializer.validated_data['email']
            username = serializer.validated_data['username']
            password = serializer.validated_data['password']

            if User.objects.filter(email=email).exists():
                return Response({'error': 'Email address already exists. Please use a different email address.'}, status=status.HTTP_400_BAD_REQUEST)

            try:
                # Create a user without a custom user model
                user = User.objects.create_user(username=username, email=email, password=password)
                return Response({'message': 'User successfully created'}, status=status.HTTP_201_CREATED)
            except IntegrityError as e:
                message = 'Username already exists. Please choose a different username.'
                return Response({'error': message}, status=status.HTTP_400_BAD_REQUEST)

        return Response({'error': serializer.errors}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def user_login(request):
    if request.method == 'POST':
        data = request.data
        serializer = UserLoginSerializer(data=data)
        
        if serializer.is_valid():
            username = serializer.validated_data['username']
            password = serializer.validated_data['password']

            user = authenticate(request, username=username, password=password)
            if user:
                login(request, user)
                return Response({'message': 'Login successful'}, status=status.HTTP_200_OK)
            else:
                return Response({'error': 'Password or email was wrong. Please try again.'}, status=status.HTTP_401_UNAUTHORIZED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def user_logout(request):
    # Django's logout function will automatically handle the session or token invalidation.
    logout(request)
    return Response({'message': 'Successfully logged out.'}, status=status.HTTP_200_OK)

@api_view(['POST'])
def user_reset_password_request(request):
    if request.method == 'POST':
        serializer = PasswordResetSerializer(data=request.data)
        if serializer.is_valid():
            username = serializer.validated_data['username']
            new_password = serializer.validated_data['new_password']
            try:
                user = User.objects.get(username=username)
            except User.DoesNotExist:
                return Response({'error': 'No user with that username.'}, status=status.HTTP_400_BAD_REQUEST)
            
            # Set the new password for the user
            user.set_password(new_password)
            user.save()
            
            return Response({'message': 'Password reset successful.'}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['POST'])
def user_delete(request):
    if request.method == 'POST':
        username = request.data.get('username')
        password = request.data.get('password')
        
        user = authenticate(request, username=username, password=password)
        if user is None:
            return Response({'error': 'Invalid username or password.'}, status=status.HTTP_401_UNAUTHORIZED)
        
        # Delete the user account
        user.delete()
        
        return Response({'message': 'Account deleted successfully.'}, status=status.HTTP_200_OK)

   