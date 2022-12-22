from django.db import models
from django.contrib.auth.models import User
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from django.utils import timezone


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    operation = models.ForeignKey('Operation', on_delete=models.SET_NULL, null=True)
    operationName = models.CharField(max_length=300, blank=True, null=True)
    department = models.ForeignKey('Department', on_delete=models.SET_NULL, null=True)
    departmentName = models.CharField(max_length=300, blank=True, null=True)
    subGroup = models.ManyToManyField('Subgroup')
    createdAt = models.DateTimeField(auto_now_add=True)
    today = models.DateField(default=timezone.now)
    description = RichTextField(blank=True, null=True)
    orderId = models.CharField(max_length=50)
    isConfirmed = models.BooleanField(default=False)  # Confirmed by manager
    priority = models.CharField(max_length=5, blank=True, null=True)
    status = models.CharField(max_length=200, blank=True, null=True)  # Which step is right now
    isCompleted = models.BooleanField(default=False)

    class Meta:
        unique_together = ("today", "operation")

    def __str__(self):
        return str(self.orderId)

    @property
    def get_priority(self):
        if self.priority == '1':
            return 'کم'
        elif self.priority == '2':
            return 'متوسط'
        elif self.priority == '3':
            return 'زیاد'


class Department(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Operation(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Subgroup(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name


class Task(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    description = RichTextUploadingField()
    description2 = RichTextUploadingField()
    date = models.DateField(null=True)
    start_time = models.TimeField(null=True)
    end_time = models.TimeField(null=True)
    hours = models.CharField(max_length=20, blank=True, null=True)
    completed = models.BooleanField(default=False)

    def __str__(self):
        return f'{self.order.orderId}'
