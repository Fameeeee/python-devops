# 🛡️ Secure Python API (DevSecOps Pipeline)

[![DevSecOps CI Pipeline](https://github.com/Fameeeee/python-devops/actions/workflows/secure-pipeline.yml/badge.svg)](https://github.com/Fameeeee/python-devops/actions/workflows/secure-pipeline.yml)

A lightweight, secure-by-design API built to demonstrate core **DevSecOps** practices, including secure containerization and automated vulnerability scanning (Shift-Left Security).

## 🎯 Project Objective

This project is not about complex business logic; it's an infrastructure blueprint. The primary goal is to showcase the integration of security tools into the CI/CD pipeline, preventing vulnerabilities from reaching production environments.

## 🛠️ Tech Stack & Tools

- **Backend:** Python 3.11, FastAPI
- **Containerization:** Docker (Multi-stage, Slim image)
- **CI/CD:** GitHub Actions
- **Security Scanning:** Trivy (Container & Dependency Vulnerability Scanner)

## 🔒 Security Features Implemented

1. **Non-Root Container Execution:** The `Dockerfile` is explicitly configured to run the application as a restricted, non-root user (`appuser`) to mitigate privilege escalation attacks.
2. **Automated Vulnerability Scanning:** GitHub Actions triggers **Trivy** on every push/PR. The pipeline acts as a security gate and will instantly fail (`exit-code: 1`) if `HIGH` or `CRITICAL` CVEs are detected in dependencies or base images.
3. **Minimal Attack Surface:** Utilizes `python:3.11-slim` as the base image to reduce unnecessary OS packages and potential attack vectors.

## 🚀 How to Run Locally

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Fameeeee/python-devops.git
   cd python-devops

   ```

2. **Build the secure Docker image:**

   ```bash
   docker build -t secure-python-api .
   ```

3. **Run the container:**

   ```bash
   docker run -p 8000:8000 secure-python-api
   ```

4. **Test the endpoint:**
   ```bash
   Open your browser and navigate to http://localhost:8000/health
   ```
