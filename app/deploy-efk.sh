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
helm repo add elastic https://helm.elastic.co
# with Helm 2: 
helm install --name elasticsearch --version 7.9.2 elastic/elasticsearch