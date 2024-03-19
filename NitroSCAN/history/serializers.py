from rest_framework import serializers
from .models import UserHistory, UserFavoritesView

class UserHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = UserHistory
        fields = '__all__'

