from django.shortcuts import render

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import UserHistory
from .serializers import UserHistorySerializer
from rest_framework.permissions import IsAuthenticated

class UserHistoryView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        user_history = UserHistory.objects.filter(user=user)
        serializer = UserHistorySerializer(user_history, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
class UserFavoritesView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        favorites = UserHistory.objects.filter(user=user, favorite_number__isnull=False)
        serializer = UserHistorySerializer(favorites, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request):
        serializer = UserHistorySerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=request.user)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
