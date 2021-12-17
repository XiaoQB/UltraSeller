cd ui-service
npm install
npm run build
cd ..
mvn clean package
#echo "login  with password" & docker login --username=75560 --password 75560zcb
echo "build docker images and tag" &
docker buildx  build -t 75560/ultraseller-mysql:latest1 --platform=linux/x86_64 ./us-mysql
docker buildx  build -t 75560/ultraseller-user:latest --platform=linux/x86_64 ./us-user-service
docker buildx  build -t 75560/ultraseller-commodity:latest --platform=linux/amd64 ./us-commodity-service
docker buildx  build -t 75560/ultraseller-wallet:latest --platform=linux/amd64 ./us-wallet-service
docker buildx  build -t 75560/ultraseller-order:latest --platform=linux/amd64 ./us-order-service
docker buildx  build -t 75560/ultraseller-ui:latest --platform=linux/amd64  ./ui-service
docker buildx  build -t 75560/ultraseller-cart:latest --platform=linux/amd64  ./us-cart-service


echo "push docker images to /75560" &
docker push 75560/ultraseller-user:latest
docker push 75560/ultraseller-commodity:latest
docker push 75560/ultraseller-gateway:latest
docker push 75560/ultraseller-wallet:latest
docker push 75560/ultraseller-ui:latest
docker push 75560/ultraseller-mysql:latest1
docker push 75560/ultraseller-order:latest
docker push 75560/ultraseller-cart:latest
