
from django.db import models
from django.contrib.auth.models import User, Permission

from base.models import Department

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    mobileNumber = models.CharField(max_length=11, blank=True, null=True)
    department = models.ForeignKey(Department, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        if self.user.first_name:
            return f'{self.user.first_name} {self.user.last_name}'
        else:
            return 'مدیریت'
