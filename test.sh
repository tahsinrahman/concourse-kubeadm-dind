#!/bin/sh

set -ex

source /docker-lib.sh
start_docker

docker run hello-world

apk update && apk add bash curl
wget https://cdn.rawgit.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.8.sh
chmod +x dind-cluster-v1.8.sh
./dind-cluster-v1.8.sh up
chmod +x $HOME/.kubeadm-dind-cluster/*
export PATH="$HOME/.kubeadm-dind-cluster:$PATH"
kubectl get nodes
./dind-cluster-v1.8.sh up
kubectl get nodes
