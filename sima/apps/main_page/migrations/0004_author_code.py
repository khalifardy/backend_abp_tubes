# Generated by Django 5.0.4 on 2024-04-29 12:07

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("main_page", "0003_book_premium"),
    ]

    operations = [
        migrations.AddField(
            model_name="author",
            name="code",
            field=models.CharField(default="", max_length=100),
        ),
    ]