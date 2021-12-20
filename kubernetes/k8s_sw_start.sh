kubectl apply -f deploy/mysql.yaml

kubectl apply -f skywalking/sw_gateway.yaml
kubectl apply -f skywalking/sw_ui.yaml
kubectl apply -f skywalking/sw_user.yaml
kubectl apply -f skywalking/sw_commodity.yaml
kubectl apply -f skywalking/sw_wallet.yaml
kubectl apply -f skywalking/sw_order.yaml
kubectl apply -f skywalking/sw_cart.yaml

kubectl apply -f hpa/hpa_deploy.yml
