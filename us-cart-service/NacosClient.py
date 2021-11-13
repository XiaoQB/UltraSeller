from nacos_sdk_python import nacos 
from nacos_sdk_python.nacos import NacosClient
import uvicorn

def register_server_to_nacos(service_ip, port, service_name, namespaceId, namespace, group):
    """
    注册服务到nacos
    :param service_ip:  django启动的服务所在的ip
    :param port:  django启动的服务所在的端口
    :param service_name:  服务名称
    :param namespaceId:  命名空间Id
    :param namespace: 命名空间
    :return: None
    """
    nacos_client = nacos.NacosClient('47.102.97.229', 8848, username="nacos", password="nacos")  # Nacos注册中心提供的ip和端口
    # 注册服务 非持久化 自动上传心跳包
    try:
        response = nacos_client.add_naming_instance(service_name = service_name, ip = service_ip, port = port)
        print('register', response)
    except Exception as e:
        print('register err:')
        print(e.__str__())

    # 查询服务详情
    try:
        response = nacos_client.list_naming_instance(service_name = service_name, healthy_only = True)
        print('detail', response)
    except Exception as e:
        print(e.__str__())

    # 自动心跳包
    try:
        response = nacos_client.send_heartbeat(service_name = service_name, ip = service_ip, port = port)                                             
        print('send_beat', response)
    except Exception as e:
        print('send beat err:')
        print(e.__str__())



if __name__ == '__main__':
    # django运行服务地址
    service_ip = 'localhost'
    # django运行服务名称
    service_name = 'us-cart-service'

    # django命名空间ID
    namespaceId = ''
    # django命名空间
    namespace = 'public'
    # django组
    group = 'DEV_GROUP'
    # django服务器运行端口
    port = 8012

    register_server_to_nacos(service_ip, port, service_name, namespaceId, namespace, group)
    
    # uvicorn运行django程序
    uvicorn.run("Shopcar.asgi:application", host='0.0.0.0', port=port, log_level="info", reload=False)
