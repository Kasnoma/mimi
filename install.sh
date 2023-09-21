#!/bin/bash
#!/bin/bash

# Update package list and install required packages
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
#sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Install Docker
if ! [ -x "$(command -v docker)" ]; then
  echo "Installing Docker..."
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo usermod -aG docker $USER
  rm get-docker.sh
fi

# Install kubectl
if ! [ -x "$(command -v kubectl)" ]; then
  echo "Installing kubectl..."
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/kubectl
fi

# Install Kind
if ! [ -x "$(command -v kind)" ]; then
  echo "Installing Kind..."
  curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.20.0/kind-windows-amd64
  Move-Item .\kind-windows-amd64.exe c:\Users\MmesomaOkaro\Downloads\K8S\Myapp\kind.exe
  #curl -Lo kind https://github.com/kubernetes-sigs/kind/releases/tag/v0.20.0/kind-linux-amd64
  c#hmod +x kind
  #sudo mv kind /myapp/kind
  #sudo mv kind /usr/local/bin/kind
fi

# Check Docker and Kind versions
docker --version
kubectl version --client
kind version

echo "Kubernetes, Docker, and Kind are installed successfully."

# Create a Kind cluster
echo "Creating a Kind cluster..."
kind create cluster mimi

# Store kubeconfig in a safe place (e.g., ~/.kube/config)
kubeconfig_path="$HOME/.kube/config"
kind_kubeconfig_path="$(kind get kubeconfig-path)"
if [ -f "$kind_kubeconfig_path" ]; then
  echo "Copying kubeconfig to a safe place..."
  mkdir -p "$(dirname $kubeconfig_path)"
  cp "$kind_kubeconfig_path" "$kubeconfig_path"
  echo "Kubeconfig saved to $kubeconfig_path"
else
  echo "Error: Kubeconfig not found at $kind_kubeconfig_path"
fi