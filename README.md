
# 🚀 OpenShift DevOps Project – End-to-End Deployment

## 📌 Project Overview

This project demonstrates an end-to-end DevOps workflow where a Python Flask microservice is containerized using Docker and deployed on OpenShift using Helm.

It covers CI/CD automation, Kubernetes deployment, and real-world troubleshooting scenarios.

---

## 🧱 Architecture


## ⚙️ Technologies Used

- Python (Flask)
- Docker
- DockerHub
- Kubernetes / OpenShift (CRC)
- Helm
- GitHub Actions
- Trivy (Security scanning)

---

## 🧩 Application Details

- Flask-based microservice
- Endpoints:
  - `/` → Hello DevOps 🚀
  - `/health` → Returns application health status

---

## 🐳 Containerization

### Build Image

docker build -t tilakjena/devops-app .

### Push to DockerHub

docker push tilakjena/devops-app

### Deployment using Helm
- Install Application

helm install devops-app .

-Verify

oc get pods
oc get svc

- Access Application

oc port-forward svc/devops-app-nginx-helm 8080:8080

open:

http://localhost:8080
http://localhost:8080/health

### CI/CD Pipeline

The pipeline is implemented using GitHub Actions.

Steps:

- Code committed to GitHub
- Workflow triggers automatically
- Docker image is built
- Image is pushed to DockerHub
- Trivy scan checks vulnerabilities
- Helm deploys the application

### Security

Used to track:

Pod health
Logs
Restart counts

🎯 Key Learnings

Docker containerization
Kubernetes and OpenShift deployment
Helm templating and release management
CI/CD pipeline automation
Debugging real-world DevOps issues


✅ Outcome
Successfully built and deployed a containerized microservice with:

Automated CI/CD pipeline
Helm-based deployment
Real production-like troubleshooting experience


👤 Author
Tilak Jena
DevOps Engineer











