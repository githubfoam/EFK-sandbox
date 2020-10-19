#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=============================EFK Elastic Fluentd Kibana============================================================="

# helm repo add stable https://kubernetes-charts.storage.googleapis.com/
# helm repo update

# helm install elasticsearch stable/elasticsearch #WARNING: This chart is deprecated
# sleep 10

# kubectl apply -f app/fluentd-daemonset-elasticsearch.yaml

# helm install kibana stable/kibana -f app/kibana-values.yaml

# kubectl apply -f app/counter.yaml

# curl kibana dashboard

# Install released version using Helm repository
# https://hub.helm.sh/charts/elastic/elasticsearch
# Add the Elastic Helm charts repo: 
# helm repo add elastic https://helm.elastic.co
# # with Helm 3: 
# helm install elasticsearch --version 7.9.2 elastic/elasticsearch

echo "=============================EFK Elastic Fluentd Kibana============================================================="

kubectl config view

docker ps | grep kube-apiserver

# mkdir -p $HOME/.kube
# cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# chown $(id -u):$(id -g) $HOME/.kube/config

# kubectl get namespaces

# create the kube-logging Namespace
cat <<EOT | sudo tee kube-logging.yaml
kind: Namespace
apiVersion: v1
metadata:
  name: kube-logging
EOT
