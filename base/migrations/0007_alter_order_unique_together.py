# Generated by Django 4.1.4 on 2022-12-21 13:35

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0006_alter_department_name_alter_operation_name'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='order',
            unique_together={('createdAt', 'operation')},
        ),
    ]
