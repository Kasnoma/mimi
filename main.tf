resource "kubectl_manifest" "node-app_deployment" {
  yaml_body = <<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test-app
  labels:
    app: test-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: test-app
  template:
    metadata:
      labels:
        app: test-app
    spec:
      containers:
      - name: test-app 
        image: mimi0248/mimi-k8s:1.0
        ports:
        - containerPort: 3000

YAML
}

resource "kubectl_manifest" "node-app_service" {
  yaml_body = <<YAML
apiVersion: v1
kind: Service
metadata:
  name: test-app-service
  labels:
    app: test-app
spec:
  type: NodePort
  ports:
   - targetPort: 3000
     port: 3000
     nodePort: 30003
  selector:
    app: test-app
  

YAML
}

resource "helm_release" "kube_prometheus" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "monitoring"

  set {
    name  = "prometheus.prometheusSpec.retention"
    value = "30d" # Adjust retention settings as needed
  }

  # Add other configuration options as needed
}
