# DevOps Simple Web App Project

## Overview
This project implements the multi-cloud DevOps practices using AWS and IBM Cloud. It demonstrates infrastructure automation, configuration management, CI/CD setup, and monitoring/logging using industry-standard tools.

---

## Infrastructure as Code (IaC)

### Tools: `Terraform`
- Separate Terraform modules for AWS and IBM Cloud
  - `terraform/aws-ec2/`
  - `terraform/ibm-instance/`
- Provisions:
  - EC2 (AWS) and VSI (IBM) instances
  - VPC, subnets, security groups, internet gateways
  - IAM role for AWS CloudWatch access

### Run Instructions:
```bash
cd terraform/aws-ec2
terraform init
terraform apply
```

---

## Configuration Management

### Tools: `Ansible`
- Configures each server with:
  - Docker
  - CloudWatch Agent (on AWS)
  - Sample app deployment

```bash
cd ansible
ansible-playbook -i inventory playbook.yaml
```

---

## CI/CD Pipeline

### Tools: `Jenkins`
- Triggers on push to `main`
- Steps:
  - Build Docker image
  - Scan with Grype
  - Run smoke tests
  - Deploy to AWS EC2 via Ansible or SSH

```bash
docker run -p 8085:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:latest
```

Jenkins job was created manually via UI.

---

## Monitoring & Logging

### Tools:
- **AWS**: CloudWatch for logs and metrics
- **Grafana**: Dockerized and manually connected to CloudWatch

```bash
docker run -d   --name=grafana   -p 3000:3000   -v grafana-storage:/var/lib/grafana   -e AWS_ACCESS_KEY_ID=<your_key>   -e AWS_SECRET_ACCESS_KEY=<your_secret>   -e AWS_REGION=us-east-1   grafana/grafana
```

Grafana dashboards show logs and metrics from CloudWatch.

---

## Application Overview

- Directory: `pythonWebApp/`
  - `app.py`: Flask app with "Hello, Paper.Social"
  - `Dockerfile`: Containerizes the app

---

## Security Measures
- SSH key-based access
- IAM roles for AWS permissions
- Jenkins secrets handled via credential manager

---

## Cost Optimization
- AWS: Free-tier `t2.micro` used
- IBM: Designed for low-cost VSI (simulated)

---

## Scalability & Concurrency
- Use `count` in Terraform to scale EC2
- Load balancer module can be added
- Jenkins supports parallel deployments with matrix strategy

---

## Design Decisions
- No untested stubs or placeholders
- Simple, modular, reusable infrastructure
- Clean separation between AWS and IBM configurations

---

## Repository Structure
```
.
├── terraform
│   ├── aws-ec2
│   └── ibm-instance
├── ansible
│   └── roles/setup_server
├── pythonWebApp
│   └── Jenkinsfile, app.py, Dockerfile
└── README.md
```

---

## Future Enhancements

- Add dynamic cloud provider support in Terraform
- Deploy based on Git branch (e.g., `main` for AWS, `ibm` for IBM Cloud)
- Introduce DNS-based failover across clouds
- Switch Grafana to use secure environment variable management
- Simulate IBM deployments locally using mock outputs

---

## Local Setup

### Install Ansible
```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

### Run Jenkins (Docker)
```bash
docker run -p 8085:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:latest
```

### Run Grafana (Docker)
```bash
docker run -d   --name=grafana   -p 3000:3000   -v grafana-storage:/var/lib/grafana   -e AWS_ACCESS_KEY_ID=<your_key>   -e AWS_SECRET_ACCESS_KEY=<your_secret>   -e AWS_REGION=us-east-1   grafana/grafana
```

> In production, pass AWS credentials securely via Docker Compose or env files.

---
