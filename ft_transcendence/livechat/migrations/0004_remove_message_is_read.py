# Generated by Django 5.1.7 on 2025-04-25 00:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('livechat', '0003_chat_created_at'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='message',
            name='is_read',
        ),
    ]
