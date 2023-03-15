from __future__ import absolute_import, unicode_literals
from celery import shared_task
from datetime import datetime
from .utils import send_review_order
import time

from review.models import Review


@shared_task(name='check_review_due')
def check_review_due(*args, **kwargs):
    for review in Review.objects.all():
        period_scale = review.reviewPeriod
        if period_scale == 'seconds':
            if abs(int(time.time()) - int(review.last_sms.split('.')[0])) >= review.reviewCount:
                print(datetime.now().time())
                print(f'send sms and reset time for review {review.partName} {review.machineName}')
                send_review_order(review.machineName, '09300629575')
                review.last_sms = int(time.time())
                review.save()

        # if period_scale == 'day':
        #     if abs(int(time.time()) - int(review.last_sms.split('.')[0])) >= review.reviewCount * 86400:
        #         print('send sms and reset time')
        #         review.last_sms = int(time.time())
        #         review.save()
        # elif period_scale == 'month':
        #     if abs(int(time.time()) - int(review.last_sms.split('.')[0])) >= review.reviewCount * 2629800:
        #         print('send sms and reset time')
        #         review.last_sms = int(time.time())
        #         review.save()
        # elif period_scale == 'year':
        #     if abs(int(time.time()) - int(review.last_sms.split('.')[0])) >= review.reviewCount * 31557600:
        #         print('send sms and reset time')
        #         review.last_sms = int(time.time())
        #         review.save()
