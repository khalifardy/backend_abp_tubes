# Generated by Django 5.0.4 on 2024-04-23 12:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("auths", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="usersima",
            name="tanggal_lahir",
            field=models.DateField(default=None),
            preserve_default=False,
        ),
    ]
