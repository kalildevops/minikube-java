# Java Spring Boot app on Minikube

## Build locally

### Build using Maven
```bash
cd app
./mvnw clean package
```

### Run using Maven
```bash
cd app
./mvnw spring-boot:run
```

## Docker

### Docker build

```bash
docker build -t java-app .
```

### Docker Run
```bash
docker run -p 8080:8080 --name java-app java-app:latest
```
### Docker Tag
```bash
docker tag java-springboot-multipath:latest <your_dockerhub_username>/java-springboot-multipath:latest
```
### Docker Push
```bash
docker push <your_dockerhub_username>/java-springboot-multipath:latest
```
## Helm

### Helm install Java App
```bash
cd app/helm
helm install java-springboot --kube-context minikube -f values-dev.yaml .
```

### Helm Rolling Update
```bash
cd app/helm
helm upgrade java-springboot --kube-context minikube -f values-dev.yaml .
```

### Helm uninstall Java App 
```bash
helm uninstall java-springboot --kube-context minikube
```

## HPA
### Enable metrics-server for minikube
```bash
minikube addons enable metrics-server
```
### Start minikube with HPA
```bash
minikube start \
--extra-config=controller-manager.horizontal-pod-autoscaler-upscale-delay=1m \
--extra-config=controller-manager.horizontal-pod-autoscaler-downscale-delay=1m \
--extra-config=controller-manager.horizontal-pod-autoscaler-sync-period=10s  \
--extra-config=controller-manager.horizontal-pod-autoscaler-downscale-stabilization=1m
```
## Observability

### Installation
Check ```observability/install.sh``` script
This script install the Helm charts for:
- Opentelemetry
- Prometheus
- Grafana
- Grafana Loki
- Jaeger
- Zipkin

### Prometheus
```
The Prometheus server can be accessed via port 80 on the following DNS name from within your cluster:
prometheus-server.observability.svc.cluster.local


Get the Prometheus server URL by running these commands in the same shell:
  export POD_NAME=$(kubectl get pods --namespace observability -l "app.kubernetes.io/name=prometheus,app.kubernetes.io/instance=prometheus" -o jsonpath="{.items[0].metadata.name}")
  kubectl --namespace observability port-forward $POD_NAME 9090


The Prometheus alertmanager can be accessed via port 9093 on the following DNS name from within your cluster:
prometheus-alertmanager.observability.svc.cluster.local


Get the Alertmanager URL by running these commands in the same shell:
  export POD_NAME=$(kubectl get pods --namespace observability -l "app.kubernetes.io/name=alertmanager,app.kubernetes.io/instance=prometheus" -o jsonpath="{.items[0].metadata.name}")
  kubectl --namespace observability port-forward $POD_NAME 9093
#################################################################################
######   WARNING: Pod Security Policy has been disabled by default since    #####
######            it deprecated after k8s 1.25+. use                        #####
######            (index .Values "prometheus-node-exporter" "rbac"          #####
###### .          "pspEnabled") with (index .Values                         #####
######            "prometheus-node-exporter" "rbac" "pspAnnotations")       #####
######            in case you still need it.                                #####
#################################################################################


The Prometheus PushGateway can be accessed via port 9091 on the following DNS name from within your cluster:
prometheus-prometheus-pushgateway.observability.svc.cluster.local


Get the PushGateway URL by running these commands in the same shell:
  export POD_NAME=$(kubectl get pods --namespace observability -l "app=prometheus-pushgateway,component=pushgateway" -o jsonpath="{.items[0].metadata.name}")
  kubectl --namespace observability port-forward $POD_NAME 9091

For more information on running Prometheus, visit:
https://prometheus.io/
```

## k8s

### Troubleshooting
```bash
kubectl logs -f <pod_name> -n java-apps
```

## Testing

Open terminal to get URL
```bash
minikube service java-springboot-service -n java-apps --url
```

Example, if you get http://127.0.0.1:57165  as result, you can open in your browser http://127.0.0.1:57165 or http://localhost:57165 and test your paths

```bash
http://localhost:57165/path1
http://localhost:57165/path2
http://localhost:57165/path3
```
