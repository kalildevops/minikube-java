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

### Helm uninstall Java App 
```bash
cd app/helm
helm uninstall java-springboot --kube-context minikube
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

http://localhost:57165/path1
http://localhost:57165/path2
http://localhost:57165/path3
