# Create Namespace
kubectl --context=minikube create namespace observability

# Install Opentelemetry
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
helm install my-opentelemetry-collector open-telemetry/opentelemetry-collector \
--namespace observability \
--set mode=deployment

# Install Prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/prometheus --namespace observability
export POD_NAME=$(kubectl get pods --namespace observability -l "app.kubernetes.io/name=prometheus,app.kubernetes.io/instance=prometheus" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace observability port-forward $POD_NAME 9090

