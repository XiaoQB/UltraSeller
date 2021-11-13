from django.shortcuts import render
from django.views.decorators.http import require_http_methods
# Create your views here.
from django.http import HttpResponse, response
import requests
from .models import cart
import json
from django.views.decorators.csrf import csrf_exempt

from json import dumps

from datetime import date, datetime
from nacos_sdk_python import nacos 

# 修正时间无法json格式化
class ComplexEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')
        elif isinstance(obj, date):
            return obj.strftime('%Y-%m-%d')
        else:
            return json.JSONEncoder.default(self, obj)

# 遍历筛选
def getKwargs(data={}):
    kwargs = {}
    for (k, v) in data.items():
        if v is not None and v != "":
            kwargs[k] = v
    return kwargs





def index(request):
    return HttpResponse("Hello, world. Shopcar.")


# 1. 进入页面 uid 初始化 其商品
# 2. 增删改查 前端自己算
# 3. 退出页面 将当前uid [{gid cart_nums}] 返回

# 添加购物车 post AddCart(uid, gids, cart_nums)
# 拿到参数 判断用户是否存在 判断商品是否存在  存入表（判断是否已经是加入购物车的）

# 初始化购物车 get GetCart(uid)
# 拿到参数  判断用户是否存在 返回表中数据 

# 下订单 post CartToOrder(uid, gids, cart_nums)
# 拿到参数，判断用户是否存在，判断商品是否存在，调创建订单接口，更新表


# # 判断是否登录，使用header 中的 token


# host.docker.internal

@require_http_methods(["GET"]) # 返回所有
def GetCart(request):
    uid = request.GET.get('uid')
    objs = cart.objects.filter(buyer_id = uid)
    token = request.META.get("HTTP_TOKEN")
    headers = {"token":token}
    res = {}
    data = []
    for obj in objs:
        good = {}
        gid = obj.commodity_id
        cart_num = obj.cart_num
        status = obj.status
        create_time = obj.create_time
        update_time = obj.update_time
# mac docker 无法获得宿主机IP 通过 host.docker.internal 获取 每台宿主机 不同 
# linux 直接在 compose 中 使用 network: localhost 即可
        # url = 'http://192.168.65.2:8002/commodity/item'
        SERVER_ADDRESSES = '47.102.97.229:8848'
        NAMESPACE = "public"

        client = nacos.NacosClient(SERVER_ADDRESSES, namespace=NAMESPACE, username="nacos", password="nacos")

        data_id = "us-gateway-service-dev.yml"
        group = "DEV_GROUP"

        service_name = "us-commodity-service"
        nacosres = client.list_naming_instance(service_name = service_name, clusters = '', namespace_id = '', group_name = 'DEFAULT_GROUP',  healthy_only = True)
        hosts =  nacosres.get("hosts")
        if len(hosts) > 0:
            host = hosts[0]
            ip = host.get("ip")
            port = host.get("port")
        url = 'http://{}:{}/commodity/item'.format(ip, port)

        params = {'id': gid}
        response = requests.get(url=url, params=params, headers=headers)
        response = response.json()
        if response.get('code')== 200:
            good['data'] = response.get('data')
            good['cart_num'] = cart_num
            good['status'] = status
            good['create_time'] = create_time
            good['update_time'] = update_time
        else:
            return HttpResponse(response)
        data.append(good)
    
    res['uid'] = uid
    res['goods_list'] = data

    return HttpResponse(json.dumps(res,cls=ComplexEncoder))


@csrf_exempt
@require_http_methods(["POST"])
def AddCart(request):
    data = json.loads(request.body)
    uid = data.get('uid')
    goods_list = data.get('goods_list')

    token = request.META.get("HTTP_TOKEN")
    headers = {"token":token}

    for good in goods_list:
        gid = good.get("id") 
        cart_num = good.get("cart_num")
        status = good.get("status")
        create_time = good.get("create_time")
        update_time = good.get("update_time")
        # 请求库存 判断当前数量是否合法

        url = 'http://192.168.65.2:8002/commodity/item'
        params = {'id': gid}
        response = requests.get(url=url, params=params,  headers=headers)
        response = response.json()

        if response.get('code')== 200:
            data = response.get("data") 
            inventory = data.get("inventory")
            if cart_num <= inventory:
                dictCheck = {"buyer_id": uid, "commodity_id": gid}
                dictFor = getKwargs(dictCheck)
                #利用**解引用，进行数据条件查询
                obj = cart.objects.filter( **dictFor)
                if obj.count() == 0:
                    obj = cart.objects.create(buyer_id = uid, commodity_id = gid, cart_num = cart_num, status = status, 
                                             create_time = create_time, update_time = update_time)
                else:
                    obj = obj[0]
                    obj.cart_num = cart_num
                    obj.update_time = update_time
                    obj.save()
            else:
                return HttpResponse("Exceeding stock or purchase limits!")
        else:
            return HttpResponse(response)
    
    return HttpResponse("AddCart Succes!")


@csrf_exempt
@require_http_methods(["POST"])
def Cart2Order(request):
    # 调用http http://localhost:8003/order/create
    data = json.loads(request.body)
    uid = data.get('uid')
    goods_list = data.get('goods_list')
    address = data.get('address')
    res = {}
    res['buyerId'] = uid
    res['address'] = address
    res['status'] = data.get('status')
    commodities = []
    token = request.META.get("HTTP_TOKEN")
    headers = {"token":token}

    for good in goods_list:
        commodity = {}
        gid = good.get("data").get("id") 
        commodity["num"] = good.get("order_num")
        commodity["id"] = gid
        #status = good.get("status")
        
        # 请求库存 判断当前数量是否合法
        url = 'http://192.168.65.2:8002/commodity/item'
        params = {'id': gid}
        response = requests.get(url=url, params=params,  headers=headers)
        response = response.json()
        
        if response.get('code')== 200:
            data = response.get("data") 
            commodity["inventory"] = data.get("inventory")
            commodity["price"] = data.get("price")
            commodity["name"] = data.get("name")
        else:
            return HttpResponse(response)
        commodities.append(commodity)
    
    res["commodities"] = commodities  
    # return HttpResponse(dumps(res))
    # 请求下单 

    url = 'http://192.168.65.2:8004/order/create?'
    headers = {'content-Type': 'application/json'}
    response = requests.post(url=url, data=dumps(res), headers=headers)
    response = response.json()

    # 下单成功 修改数据库
    if response.get('code') == 200:
        for good in goods_list:
            gid = good.get("id")
            order_num = good.get("order_num")
            
            dictCheck = {"buyer_id": uid, "commodity_id": gid}
            dictFor = getKwargs(dictCheck)
            #利用**解引用，进行数据条件查询
            obj = cart.objects.filter( **dictFor)
            obj = obj[0]
            obj.cart_num = obj.cart_num - order_num
            if obj.cart_num > 0:
                obj.save()
            else:
                obj.delete()  

    return HttpResponse(dumps(response))
    
   
# delete 接口 
