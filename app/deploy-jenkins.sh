#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=============================deploy jenkins============================================================="

# create the Jenkins namespace
kubectl create namespace jenkins

# create the kube-logging Namespace
cat <<EOT | sudo tee jenkins.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jenkins
spec:
  replicas: 1
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      containers:
      - name: jenkins
        image: jenkins/jenkins:lts
        ports:
          - name: http-port
            containerPort: 8080
          - name: jnlp-port
            containerPort: 50000
        volumeMounts:
          - name: jenkins-vol
            mountPath: /var/jenkins_vol
      volumes:
        - name: jenkins-vol
          emptyDir: {}
EOT
cat jenkins.yaml

# create deployment
kubectl create -f jenkins.yaml --namespace jenkins
#  verify the pod’s state
kubectl get pods -n jenkins

# Create jenkins-service.yaml
cat <<EOT | sudo tee jenkins-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: jenkins
spec:
  type: NodePort
  ports:
    - port: 8080
      targetPort: 8080
      nodePort: 30000
  selector:
    app: jenkins

---

apiVersion: v1
kind: Service
metadata:
  name: jenkins-jnlp
spec:
  type: ClusterIP
  ports:
    - port: 50000
      targetPort: 50000
  selector:
    app: jenkins
EOT
cat jenkins.yaml

# create the Service in the same namespace
kubectl create -f jenkins-service.yaml --namespace jenkins
# Check that the Service is running
kubectl get services --namespace jenkins

# Accessing the Jenkins UI
# retrieve node IPs
# http://your_external_ip:30000.
kubectl get nodes -o wide

kubectl get pods -n jenkins


echo "=============================deploy jenkins============================================================="


