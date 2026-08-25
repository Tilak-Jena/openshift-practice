
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


## **portfolio client‑ready: problem → solution → outcomes → tools**.
# DevSecOps Case Study: Secure CI/CD on GCP

## 1. Problem Statement
- Manual deployments were slow and error‑prone.
- No automated security checks in the pipeline.
- Lack of observability and policy enforcement.

## 2. Solution Overview
Implemented a full DevSecOps pipeline:
GitHub/GitLab → SonarQube → Snyk → Trivy → Cosign → Artifact Registry → ArgoCD → Kyverno/OPA → GKE → Prometheus + Grafana

## 3. Architecture Diagram
[Insert diagram here showing flow from GitHub to GKE with security + monitoring layers]

## 4. Implementation Steps
- **Source Control:** GitHub Actions triggered on commit.
- **Code Quality:** SonarQube gates enforced.
- **Security:** Snyk + Trivy scans, Cosign signing.
- **Artifact Management:** Images pushed to Artifact Registry.
- **GitOps:** ArgoCD auto‑sync to GKE.
- **Policy Enforcement:** Kyverno blocking unsigned images.
- **Observability:** Prometheus metrics + Grafana dashboards.

## 5. Outcomes
- Deployment time reduced from 30 min → 5 min.
- 100% of images signed and verified.
- Real‑time dashboards for cluster health.
- Automated rollback on failed syncs.

## 6. Tools & Technologies
- GitHub Actions, Tekton, SonarQube, Snyk, Trivy, Cosign, Artifact Registry, ArgoCD, Kyverno, GKE, Prometheus, Grafana.

## 7. Key Learnings
- GitOps ensures drift correction.
- Security gates must be automated.
- Observability is critical for scaling.

---


👤 Author
Tilak Jena
DevOps Engineer











TriggerDevSecOps pipeline with Trivy scan test
