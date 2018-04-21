#!/bin/sh

set -x

curl -LO https://raw.githubusercontent.com/meAmidos/dcind/master/docker-lib.sh
chmod +x docker-lib.sh

source docker-lib.sh
start_docker

docker run hello-world

apt-get update &> /dev/null
apk-get install -y curl wget &> /dev/null

wget https://cdn.rawgit.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.8.sh
chmod +x dind-cluster-v1.8.sh
./dind-cluster-v1.8.sh up
chmod +x $HOME/.kubeadm-dind-cluster/*
export PATH="$HOME/.kubeadm-dind-cluster:$PATH"
kubectl get nodes
./dind-cluster-v1.8.sh up
export PATH="$HOME/.kubeadm-dind-cluster:$PATH"
kubectl get nodes
