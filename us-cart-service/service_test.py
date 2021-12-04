from nacos_sdk_python import nacos 
from nacos_sdk_python.nacos import NacosClient
import socket
import requests

service_name = 'us-cart-service'

nacos_client = nacos.NacosClient('10.176.34.97', 8848, username="nacos", password="nacos")  # Nacos注册中心提供的ip和端口
try:
    nacosres = nacos_client.list_naming_instance(service_name = service_name, healthy_only = True)
    print('detail', nacosres)
    hosts =  nacosres.get("hosts")
    # ip = "localhost"
    #     # port = host.get("port")
    # port = "8012"
    # url = 'http://{}:{}/'.format(ip, port)
    # response = requests.get(url=url)
    # print(response)
    # 获取可用端口
    num_host = len(hosts)
    while num_host:
        host = hosts[0]
        ip = host.get("ip")
        port = host.get("port")
        url = 'http://{}:{}/'.format(ip, port)
        try:
            response = requests.get(url=url)
            print(response)
            break
        except requests.exceptions.RequestException:
            num_host -= 1
    print(num_host)
except Exception as e:
    print(e.__str__())