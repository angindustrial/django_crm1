# Generated by Django 4.1.4 on 2022-12-18 10:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0003_alter_department_id_alter_operation_id_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='department',
            name='name',
            field=models.CharField(max_length=50),
        ),
    ]
