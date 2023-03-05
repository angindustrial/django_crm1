from celery import shared_task
from celery.utils.log import get_task_logger
from celery import Celery

import os
import jdatetime

celery = Celery('tasks', broker='amqp://localhost')  # !

logger = get_task_logger(__name__)

os.environ['DJANGO_SETTINGS_MODULE'] = "proj.settings"


@shared_task
def every_monday_morning():
    # TODO change birth_date field to date field in models
    print('send sms')
    logger.info('hello here')
