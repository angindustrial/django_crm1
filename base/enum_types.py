from django.db import models


class StatusChoices(models.TextChoices):
    SEEN = 'SE', 'مشاهده شده'
    DOING = "DG", 'در حال انجام'
    WAITING = "WG", "در انتظار قطعه"
    SENT = 'ST', "ارسال به پیمانکار"
    DONE = "DN", "تکمیل شده"
