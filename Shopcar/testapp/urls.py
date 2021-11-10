from django.urls import path, re_path
from . import views

urlpatterns = [
        path('', views.index, name = 'index'),
        path('shopcar/AddCart/', views.AddCart, name = 'addcart'), # post
        path('shopcar/GetCart/', views.GetCart, name = 'getcart'), # get
        path('shopcar/Cart2Order/', views.Cart2Order, name = 'cart2Order'), 
]