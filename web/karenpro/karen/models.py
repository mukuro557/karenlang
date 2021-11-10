from django.db import models

# Create your models here.
class word(models.Model):
    Word_th = models.CharField(max_length = 100,null=True)
    Sound = models.CharField(max_length = 100,null=True)

def __str__(self):
    return self.name

class questions(models.Model):
    Question = models.CharField(max_length = 100,null=True)
    Sound = models.CharField(max_length = 200,null=True)
    Type = models.IntegerField(null=True)

def __str__(self):
    return self.name
    
class choice(models.Model):
    Choice = models.CharField(max_length = 50,null=True)
    Icon = models.CharField(max_length = 60,null=True)
    Sound = models.CharField(max_length = 100,null=True)
    Question_id = models.IntegerField(null=True)

def __str__(self):
    return self.name

class usedquestion(models.Model):
    wordque = models.CharField(max_length = 100,null=True)
    type = models.IntegerField(null=True)
    miss = models.IntegerField(null=True)

def __str__(self):
    return self.name