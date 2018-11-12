eval $(minikube docker-env)
docker build -t desafio:latest .
helm install ./idwall --name desafiok8s
sleep 2
export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=idwall,app.kubernetes.io/instance=desafiok8s" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8081:3000