# Generated by Django 2.0 on 2022-12-28 17:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='today',
        ),
    ]
