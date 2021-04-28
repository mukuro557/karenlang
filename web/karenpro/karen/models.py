from django.db import models

# Create your models here.
class word(models.Model):
    Word_th = models.CharField(max_length = 100)
    Sound = models.CharField(max_length = 100)

class questions(models.Model):
    Question = models.CharField(max_length = 100)
    Sound = models.CharField(max_length = 100)
    
class choice(models.Model):
    Choice = models.CharField(max_length = 50)
    Icon = models.CharField(max_length = 60,null=True)
    Sound = models.CharField(max_length = 100)
    Question_id = models.IntegerField()

