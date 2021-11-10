from django.db import models

# Create your models here.

# 数据表 设计 redis 
# id int 主键
# uid int 用户id 关联user表 
# goods_id int 商品id 关联goods表 
# cart_num int  商品 数量 
# status int  记录状态 1 正常 0 禁用 -1 删除 
# create_time int 记录创建时间 时间戳 
# update_time int 记录更新时间， 时间戳 


class cart(models.Model):
    # id = models.AutoField(primary_key=True)
    buyer_id = models.IntegerField()
    commodity_id = models.CharField(max_length=20)
    cart_num = models.IntegerField(blank=True, null=True)
    status = models.CharField(max_length=32, default= 1)
    create_time = models.DateTimeField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)
    
    class Meta:
        db_table = 'Shopcar'

