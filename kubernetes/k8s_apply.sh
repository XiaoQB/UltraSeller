kubectl apply -f mysql.yaml
kubectl apply -f gateway.yaml
kubectl apply -f ui.yaml
kubectl apply -f user.yaml
kubectl apply -f commodity.yaml
kubectl apply -f order.yaml
kubectl apply -f cart.yaml

#kubectl autoscale deployment user-service -n ase-ns-11 --cpu-percent=50 --min=1 --max=10
#kubectl autoscale deployment shopping-cart-service -n ase-ns-11 --cpu-percent=50 --min=1 --max=10