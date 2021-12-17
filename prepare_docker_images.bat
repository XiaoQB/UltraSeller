echo "login  with password" & docker login --username=75560 --password 75560zcb
echo "build docker images and tag" & docker build -t ultraseller-users:latest ./us-user-service
docker build -t 75560/ultraseller-commodity:latest ./us-commodity-service
docker build -t 75560/ultraseller-gateway:latest ./us-gateway-service
docker build -t 75560/ultraseller-wallet:latest ./us-wallet-service
docker build -t 75560/ultraseller-order:latest ./us-order-service
docker build -t 75560/ultraseller-cart:latest ./us-cart-service
docker build -t 75560/ultraseller-ui:latest ./ui-service
echo "push docke images to /75560" & docker push ultraseller-user:latest
docker push 75560/ultraseller-gateway:latest
docker push 75560/ultraseller-wallet:latest
docker push 75560/ultraseller-ui:latest
docker push 75560/ultraseller-order:latest
docker push 75560/ultraseller-cart:latest
