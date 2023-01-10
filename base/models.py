from django.db import models
# from django.contrib.auth.models import User
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.auth import get_user_model
from base.managers import PublishedManager

User = get_user_model()


class Order(models.Model):
    StatusChoices = (
        ('SV', 'ثبت شده'),
        ('SE', 'مشاهده شده'),
        ("DG", 'در حال انجام'),
        ("WG", "در انتظار قطعه"),
        ('ST', "ارسال به پیمانکار"),
        ("DN", "تکمیل شده")
    )
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    operation = models.ForeignKey('Operation', on_delete=models.SET_NULL, null=True, related_name='order')
    operationName = models.CharField(max_length=300, blank=True, null=True)
    department = models.ForeignKey('Department', on_delete=models.SET_NULL, null=True)
    departmentName = models.CharField(max_length=300, blank=True, null=True)
    subGroup = models.ManyToManyField('Subgroup')
    createdAt = models.DateTimeField(auto_now_add=True)
    description = RichTextField(blank=True, null=True)
    orderId = models.CharField(max_length=50)
    publish = models.BooleanField(default=True)
    isConfirmed = models.BooleanField(default=False)  # Confirmed by manager
    priority = models.CharField(max_length=5, blank=True, null=True)
    status = models.CharField(max_length=200, blank=True, null=True)  # Which step is right now
    second_status = models.CharField(max_length=2, blank=True, null=True, choices=StatusChoices, default='SV')
    isCompleted = models.BooleanField(default=False)

    objects = models.Manager()
    published = PublishedManager()

    class Meta:
        unique_together = ("operation", "description")

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
    StatusChoices = (
        ('SE', 'مشاهده شده',),
        ("DG", 'در حال انجام'),
        ("WG", "در انتظار قطعه"),
        ('ST', "ارسال به پیمانکار"),
        ("DN", "تکمیل شده"),
    )
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='task')
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    description = RichTextUploadingField()
    description2 = RichTextUploadingField()
    date = models.DateField(null=True)
    start_time = models.TimeField(null=True)
    end_time = models.TimeField(null=True)
    publish = models.BooleanField(default=True)
    hours = models.CharField(max_length=20, blank=True, null=True)
    completed = models.BooleanField(default=False)
    operator = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name='operator_tasks')
    status = models.CharField(max_length=2, blank=True, null=True, choices=StatusChoices)

    objects = models.Manager()
    published = PublishedManager()

    class Meta:
        ordering = ("-date",)

    def __str__(self):
        return f'{self.order.orderId}'

    @property
    def get_time_diff(self):
        from datetime import datetime, date
        time_diff = datetime.combine(date.today(), self.end_time) - datetime.combine(date.today(), self.start_time)
        return time_diff.total_seconds()

# class RepairOperator(models.Model):
#     operator = models.OneToOneField(get_user_model(), on_delete=models.CASCADE, related_name='operator')
#
#     def __str__(self):
#         return self.operator.username
