from rest_framework import serializers
from .models import UserHistory, UserFavoritesView

class UserHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = UserHistory
        fields = '__all__'

class UserFavoritesView(serializers.ModelSerializer):
    class Meta:
        model = UserFavoritesView
        fields = '__all__'