#coding=utf-8
# -*- coding: utf-8 -*-
# Generated by Django 1.10.4 on 2017-07-19 06:35
from __future__ import unicode_literals

from django.db import migrations, models
import model_managers.logcat_model_manager


class Migration(migrations.Migration):

    dependencies = [
        ('logcat', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelManagers(
            name='logger',
            managers=[
                ('objects', model_managers.logcat_model_manager.LoggerManager()),
            ],
        ),
        migrations.RenameField(
            model_name='logger',
            old_name='DeviceID',
            new_name='appId',
        ),
        migrations.RemoveField(
            model_name='logger',
            name='AliasName',
        ),
        migrations.RemoveField(
            model_name='logger',
            name='DeviceName',
        ),
        migrations.RemoveField(
            model_name='logger',
            name='RegTime',
        ),
        migrations.AddField(
            model_name='logger',
            name='deviceId',
            field=models.CharField(default=0, max_length=50),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='logger',
            name='deviceName',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='logger',
            name='extra',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='logger',
            name='logFiles',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='logger',
            name='regTime',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='logger',
            name='userAgent',
            field=models.CharField(max_length=255, null=True),
        ),
    ]
