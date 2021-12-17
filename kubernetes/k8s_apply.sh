# kubectl apply -f networkpolicy.yaml
kubectl apply -f user-db.yaml
kubectl apply -f cart-db.yaml
kubectl apply -f eureka.yaml
kubectl apply -f gateway.yaml
kubectl apply -f user.yaml
kubectl apply -f cart.yaml

kubectl autoscale deployment user-service -n ase-ns-11 --cpu-percent=50 --min=1 --max=10
kubectl autoscale deployment shopping-cart-service -n ase-ns-11 --cpu-percent=50 --min=1 --max=10