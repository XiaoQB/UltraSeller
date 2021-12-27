cd ../ui-service
npm install
npm run build
cd ..
mvn clean package
echo "build docker images and tag" &
docker buildx  build -t 75560/ultraseller-mysql:sw6 --platform=linux/x86_64 ./us-mysql
docker buildx  build -t 75560/ultraseller-user:sw6 --platform=linux/x86_64 ./us-user-service
docker buildx  build -t 75560/ultraseller-commodity:sw6 --platform=linux/x86_64 ./us-commodity-service
docker buildx  build -t 75560/ultraseller-gateway:sw6 --platform=linux/x86_64 ./us-gateway-service
docker buildx  build -t 75560/ultraseller-wallet:sw6 --platform=linux/x86_64  ./us-wallet-service
docker buildx  build -t 75560/ultraseller-order:sw6 --platform=linux/x86_64 ./us-order-service
docker buildx  build -t 75560/ultraseller-ui:sw6 --platform=linux/x86_64  ./ui-service
docker buildx  build -t 75560/ultraseller-cart:sw6 --platform=linux/x86_64  ./us-cart-service
echo "push docker images to /75560" &
docker push 75560/ultraseller-mysql:sw6
docker push 75560/ultraseller-user:sw6
docker push 75560/ultraseller-commodity:sw6
docker push 75560/ultraseller-gateway:sw6
docker push 75560/ultraseller-wallet:sw6
docker push 75560/ultraseller-order:sw6
docker push 75560/ultraseller-ui:sw6
docker push 75560/ultraseller-cart:sw6
