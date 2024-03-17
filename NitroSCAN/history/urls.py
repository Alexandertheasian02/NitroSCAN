from django.urls import path
from .views import UserHistoryView, UserFavoritesView

urlpatterns = [
    path('history/', UserHistoryView.as_view(), name='user_history'),
    path('favorites/', UserFavoritesView.as_view(), name='user_favorites'),
]