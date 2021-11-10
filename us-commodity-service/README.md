# 接口介绍

## 列表查看

`public List<Commodity> allCommodities()`

Request: /commodity/list?username="test"&page=1&pagesize=10&seq=1

- header: Role
- body: -

param:

- username: 用户名
- page：第几页
- pagesize：每页返回几个商品
- seq：顺序，0：创建时间早的在前，1：创建时间晚的在前

Response: List

## 单个商品操作

`public Commodity singleCommodity()`

查询商品详情 Request: /commodity/item?id=0123

- header: Role
- body: -

Response: Commodity

`public void update()`
`public void create()`

增加/修改 Request: /commodity/item

- header: Role
- body: commodity

Response: 200

`public void delete()`
删除 Request: /commodity/item/{itemid} Response:

- header: Role
- body: -

## 搜索操作

`List<Commodity> searchList()`
关键词查询 Request:/commodity/search?q=奶茶%20芋泥

- header: Role
- body: - Response: List
