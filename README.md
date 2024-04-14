# Java Spring Boot app on Minikube

## Build locally

### Create project
```bash
mvn archetype:generate -DgroupId=com.example.app -DartifactId=app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```

### Build using Maven
```bash
cd app
mvn clean package
```

### Run using Maven
```bash
cd app
mvn spring-boot:run
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