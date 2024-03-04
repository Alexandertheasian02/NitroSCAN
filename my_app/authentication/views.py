from rest_framework import status
from rest_framework.decorators import api_view
from django.core.mail import send_mail
from django.db import IntegrityError
from rest_framework.response import Response
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from rest_framework.permissions import AllowAny, IsAuthenticated

from .serializer import UserSignupSerializer, UserLoginSerializer


# Function to handle user signup
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

