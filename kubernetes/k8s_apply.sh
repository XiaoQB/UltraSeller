#kubectl apply -f deploy/mysql.yaml
kubectl apply -f deploy/gateway.yaml
kubectl apply -f deploy/ui.yaml

#kubectl apply -f deploy/user.yaml
#kubectl apply -f deploy/commodity.yaml
#kubectl apply -f deploy/wallet.yaml
#kubectl apply -f deploy/order.yaml
#kubectl apply -f deploy/cart.yaml

#kubectl autoscale deployment user-service -n ase-ns-11 --cpu-percent=50 --min=1 --max=10
#kubectl autoscale deployment shopping-cart-service -n ase-ns-11 --cpu-percent=50 --min=1 --max=10