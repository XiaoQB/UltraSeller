kubectl apply -f deploy/mysql.yaml

kubectl apply -f deploy/gateway.yaml
kubectl apply -f deploy/ui.yaml
kubectl apply -f deploy/user.yaml
kubectl apply -f deploy/commodity.yaml
kubectl apply -f deploy/wallet.yaml
kubectl apply -f deploy/order.yaml
kubectl apply -f deploy/cart.yaml

kubectl apply -f hpa/hpa_deploy.yaml
