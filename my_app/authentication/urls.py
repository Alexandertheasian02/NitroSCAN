from django.urls import path
from . import views

urlpatterns = [
    path('signup/', views.user_signup, name='user_signup'),
    path('login/', views.user_login, name='user_login'),
    path('logout/', views.user_logout, name='user_logout'),
    path('resetpassword/', views.user_reset_password_request, name='user_request_password'),
    path('delete/', views.user_delete, name='user_delete'),
    # Add other paths as needed for your application
] 