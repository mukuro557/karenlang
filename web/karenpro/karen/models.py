from django.db import models

# Create your models here.
class user(models.Model):
    User_name = models.CharField(max_length = 20)
    User_password = models.CharField(max_length = 50)

class word(models.Model):
    Word_th = models.CharField(max_length = 100)
    Sound = models.CharField(max_length = 100)
class questions(models.Model):
    Question = models.CharField(max_length = 100)
    
class choice(models.Model):
    Choice = models.CharField(max_length = 50)
    Icon = models.CharField(max_length = 60)
    Question_id = models.IntegerField()

