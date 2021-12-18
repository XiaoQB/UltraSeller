cd ../ui-service
npm install
npm run build
cd ..
mvn clean package
echo "build docker images and tag" &
docker buildx  build -t 75560/ultraseller-mysql:sw --platform=linux/x86_64 ./us-mysql
docker buildx  build -t 75560/ultraseller-user:sw --platform=linux/x86_64 ./us-user-service
docker buildx  build -t 75560/ultraseller-commodity:sw --platform=linux/x86_64 ./us-commodity-service
docker buildx  build -t 75560/ultraseller-gateway:sw --platform=linux/x86_64 ./us-gateway-service
docker buildx  build -t 75560/ultraseller-wallet:sw --platform=linux/x86_64  ./us-wallet-service
docker buildx  build -t 75560/ultraseller-order:sw --platform=linux/x86_64 ./us-order-service
docker buildx  build -t 75560/ultraseller-ui:sw --platform=linux/x86_64  ./ui-service
docker buildx  build -t 75560/ultraseller-cart:sw --platform=linux/x86_64  ./us-cart-service
echo "push docker images to /75560" &
docker push 75560/ultraseller-mysql:sw
docker push 75560/ultraseller-user:sw
docker push 75560/ultraseller-commodity:sw
docker push 75560/ultraseller-gateway:sw
docker push 75560/ultraseller-wallet:sw
docker push 75560/ultraseller-order:sw
docker push 75560/ultraseller-ui:sw
docker push 75560/ultraseller-cart:sw
