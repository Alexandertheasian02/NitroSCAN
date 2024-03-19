from django.db import models
from django.contrib.auth.models import User

class UserHistory(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='history_images/')
    number = models.IntegerField()
    fertilizer_recommendation = models.CharField(max_length=200)
    favourite = models.BooleanField(default=False)

    def __str__(self):
        return f'{self.user.username} - {self.created_at}'
    

