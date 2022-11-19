echo "Criando as imagens. Aguarde..."

docker build -t brunoferreiram/k8sapp-backend:1.0 backend/.
docker build -t brunoferreiram/k8sapp-database:1.0 database/.

echo "Realizando login no docker. Aguarde..."

docker login

echo "Realizando push das imagens. Aguarde..."

docker push brunoferreiram/k8sapp-backend:1.0
docker push brunoferreiram/k8sapp-database:1.0

echo "Criando os serviços. Aguarde..."

kubectl apply -f ./services.yml

echo "Concluindo a implantação. Aguarde..."

kubectl apply -f ./deployment.yml