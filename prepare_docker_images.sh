cd ui-service
npm install
npm run build
cd ..
mvn clean package
#%s/latest/k8s-deploy/g
echo "build docker images and tag" &
docker buildx  build -t 75560/ultraseller-mysql:k8s-deploy --platform=linux/x86_64 ./us-mysql
docker buildx  build -t 75560/ultraseller-user:k8s-deploy --platform=linux/x86_64 ./us-user-service
docker buildx  build -t 75560/ultraseller-commodity:k8s-deploy --platform=linux/x86_64 ./us-commodity-service
docker buildx  build -t 75560/ultraseller-gateway:k8s-deploy4 --platform=linux/x86_64 ./us-gateway-service
docker buildx  build -t 75560/ultraseller-wallet:k8s-deploy --platform=linux/x86_64  ./us-wallet-service
docker buildx  build -t 75560/ultraseller-order:k8s-deploy --platform=linux/x86_64 ./us-order-service
docker buildx  build -t 75560/ultraseller-ui:k8s-deploy --platform=linux/x86_64  ./ui-service
docker buildx  build -t 75560/ultraseller-cart:k8s-deploy4 --platform=linux/x86_64  ./us-cart-service


echo "push docker images to /75560" &
docker push 75560/ultraseller-mysql:k8s-deploy
docker push 75560/ultraseller-user:k8s-deploy
docker push 75560/ultraseller-commodity:k8s-deploy
docker push 75560/ultraseller-gateway:k8s-deploy
docker push 75560/ultraseller-wallet:k8s-deploy
docker push 75560/ultraseller-order:k8s-deploy
docker push 75560/ultraseller-ui:k8s-deploy
docker push 75560/ultraseller-cart:k8s-deploy4
