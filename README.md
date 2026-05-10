# UIDAI Sandbox DevOps Assignment

## Overview

This project automates onboarding of startup tenants into a Kubernetes-native UIDAI Sandbox environment.

The solution includes:
- Dockerized Mock eKYC API
- Kubernetes deployments
- Redis cache
- GitHub Actions CI/CD pipeline
- Prometheus monitoring and alerting
- CrashLoopBackOff triage automation

---

## Tech Stack

- Docker
- Kubernetes
- GitHub Actions
- Prometheus
- Grafana
- Bash Scripting
- Flask (Python)

---

## Project Structure

```text
uidai-sandbox-devops-assignment/
├── Dockerfile
├── app/
├── k8s/
├── monitoring/
├── scripts/
└── .github/workflows/
```

---

## Build Docker Image

```bash
docker build -t mock-ekyc-api .
```

---

## Run Application

```bash
docker run -p 5000:5000 mock-ekyc-api
```

---

## Kubernetes Deployment

```bash
kubectl apply -f k8s/
```

---

## Monitoring

Prometheus alerting rules are available under:

```text
monitoring/prometheus-rule.yaml
```

---

## Incident Response

CrashLoopBackOff triage script:

```bash
./scripts/triage.sh startup-tenant-alpha
```

---

## Security Best Practices

- Non-root Docker container
- Multi-stage Docker build
- GitHub Secrets for credentials
- Trivy image vulnerability scanning
- Kubernetes readiness/liveness probes

---

## Author

Sai Teja
