kubectl delete configmap robo-fullfillorder-config --namespace="robo-dev"
kubectl create configmap robo-fullfillorder-config --from-file=config.env --namespace="robo-dev"
