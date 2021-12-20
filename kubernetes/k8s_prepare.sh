cd ../ui-service
npm install
npm run build
cd ..
mvn clean package
echo "build docker images and tag" &
docker buildx  build -t 75560/ultraseller-mysql:sw3 --platform=linux/x86_64 ./us-mysql
docker buildx  build -t 75560/ultraseller-user:sw3 --platform=linux/x86_64 ./us-user-service
docker buildx  build -t 75560/ultraseller-commodity:sw3 --platform=linux/x86_64 ./us-commodity-service
docker buildx  build -t 75560/ultraseller-gateway:sw3 --platform=linux/x86_64 ./us-gateway-service
docker buildx  build -t 75560/ultraseller-wallet:sw3 --platform=linux/x86_64  ./us-wallet-service
docker buildx  build -t 75560/ultraseller-order:sw3 --platform=linux/x86_64 ./us-order-service
docker buildx  build -t 75560/ultraseller-ui:sw3 --platform=linux/x86_64  ./ui-service
docker buildx  build -t 75560/ultraseller-cart:sw3 --platform=linux/x86_64  ./us-cart-service
echo "push docker images to /75560" &
docker push 75560/ultraseller-mysql:sw3
docker push 75560/ultraseller-user:sw3
docker push 75560/ultraseller-commodity:sw3
docker push 75560/ultraseller-gateway:sw3
docker push 75560/ultraseller-wallet:sw3
docker push 75560/ultraseller-order:sw3
docker push 75560/ultraseller-ui:sw3
docker push 75560/ultraseller-cart:sw3
