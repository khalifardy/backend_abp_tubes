# Generated by Django 5.0.4 on 2024-04-29 23:22

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("main_page", "0005_alter_book_url_buku_alter_book_url_image"),
    ]

    operations = [
        migrations.AlterField(
            model_name="book",
            name="url_image",
            field=models.ImageField(null=True, upload_to="images/"),
        ),
    ]
