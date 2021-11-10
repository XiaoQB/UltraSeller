# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Order(models.Model):
    id = models.CharField(primary_key=True, max_length=32)
    status = models.CharField(max_length=32)
    total_price = models.FloatField(blank=True, null=True)
    address = models.CharField(max_length=64)
    buyer_id = models.IntegerField()
    create_time = models.DateTimeField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order'


class SubOrder(models.Model):
    id = models.CharField(primary_key=True, max_length=32)
    order_id = models.CharField(max_length=32)
    status = models.CharField(max_length=32)
    total_price = models.FloatField(blank=True, null=True)
    address = models.CharField(max_length=64)
    saler_id = models.IntegerField()
    commodity_id = models.CharField(max_length=20)
    commodity_name = models.CharField(max_length=20)
    price = models.FloatField()
    num = models.IntegerField(blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sub_order'


class UsAdmin(models.Model):
    username = models.CharField(max_length=64)
    password = models.CharField(max_length=255)
    create_time = models.DateTimeField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'us_admin'


class UsBuyer(models.Model):
    username = models.CharField(max_length=64)
    password = models.CharField(max_length=255)
    email = models.CharField(max_length=64, blank=True, null=True)
    phone = models.CharField(max_length=64)
    create_time = models.DateTimeField()
    update_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'us_buyer'


class UsCommodity(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    name = models.CharField(max_length=20, blank=True, null=True)
    imglink = models.CharField(db_column='imgLink', max_length=64, blank=True, null=True)  # Field name made lowercase.
    price = models.IntegerField(blank=True, null=True)
    desription = models.CharField(max_length=32, blank=True, null=True)
    inventory = models.IntegerField(blank=True, null=True)
    vendorname = models.CharField(db_column='vendorName', max_length=20, blank=True, null=True)  # Field name made lowercase.
    keywords = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'us_commodity'


class UsSaler(models.Model):
    username = models.CharField(max_length=64)
    password = models.CharField(max_length=255)
    phone = models.CharField(max_length=64)
    email = models.CharField(max_length=64, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'us_saler'
