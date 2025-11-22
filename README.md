# Lightning DevOps Mini Pipeline

> A compact, end-to-end CI/CD demo: small Node.js app → Docker → GitHub Actions → GitHub Container Registry (GHCR).  
> GitHub Repository: **wilson7777777/lightning-devops-mini-pipeline**

---

## 📌 Table of Contents
1. [Project Overview](#project-overview)  
2. [Key Features](#key-features)  
3. [Repository Structure](#repository-structure)  
4. [Prerequisites](#prerequisites)  
5. [Quickstart — Run Locally](#quickstart---run-locally)  
6. [Docker — Build & Run Locally](#docker---build--run-locally)  
7. [CI/CD with GitHub Actions](#cicd-with-github-actions)  
8. [GitHub Container Registry (GHCR)](#github-container-registry-ghcr)  
9. [Workflow Explanation (ci.yml)](#workflow-explanation-ciyml)  
10. [Troubleshooting & Tips](#troubleshooting--tips)  
11. [Extending this Project](#extending-this-project)  
12. [License](#license)  
13. [Contributors](#contributors)

---

## 🚀 Project Overview
**Lightning DevOps Mini Pipeline** is a fast, hands-on DevOps project designed to demonstrate a full CI/CD pipeline in under an hour.  
It shows how code moves from your local system → GitHub → GitHub Actions CI pipeline → Docker container → GitHub Container Registry (GHCR).

This project includes:
- A tiny Node.js HTTP server (`app.js`)
- A Dockerfile optimized for fast builds
- A GitHub Actions workflow that:
  - Installs Node  
  - Runs a quick smoke test  
  - Builds a Docker image  
  - Pushes the image to GHCR automatically  

Perfect for:
- Beginners learning DevOps  
- Quick portfolio projects  
- Fast interview demos  
- Anyone needing a clean, simple CI/CD example  

---

## ⭐ Key Features
- **Minimal but real CI/CD pipeline**
- **Full Docker containerization**
- **Automatic image push to GHCR**
- **Clean repository structure**
- **Uses built-in GitHub authentication (`GITHUB_TOKEN`)**
- **Lightning-fast setup — works in minutes**

---

## 📁 Repository Structure

```
lightning-devops-mini-pipeline/
│
├── app.js                 # Simple Node HTTP server
├── package.json           # Dependencies + script
├── Dockerfile             # Image build instructions
│
└── .github/
    └── workflows/
        └── ci.yml        # CI workflow (build + push)
```

---

## 🧰 Prerequisites
Install these tools before working locally:

| Tool | Minimum Version | Purpose |
|------|-----------------|---------|
| **Node.js** | v16+ | Run the app locally |
| **Docker** | Latest | Build & run containers |
| **Git** | Any | Clone & push the repo |
| **GitHub Account** | — | Push code + use GH Actions |
| Username | `wilson7777777` | Used for GHCR |

---

## ⚡ Quickstart — Run Locally

```bash
# Install dependencies
npm install

# Start the app
npm start
```

Visit in browser:  
👉 http://localhost:3000

---

## 🐳 Docker — Build & Run Locally

### Build image
```bash
docker build -t lightning-devops-app .
```

### Run container
```bash
docker run -p 3000:3000 lightning-devops-app
```

Open:  
👉 http://localhost:3000

---

## 🔄 CI/CD with GitHub Actions
This project includes a **fully automated pipeline**:

✔ Install Node  
✔ Run smoke test  
✔ Build Docker image  
✔ Authenticate to GHCR  
✔ Push Docker image to your registry  

Pipeline runs automatically on:
- every push to `main`
- every pull request

---

## 📦 GitHub Container Registry (GHCR)

Once CI succeeds, your container image will appear at:

```
ghcr.io/wilson7777777/lightning-devops-mini-pipeline:latest
```

You can pull it anywhere:

```bash
docker pull ghcr.io/wilson7777777/lightning-devops-mini-pipeline:latest
```

---

## 🧠 Workflow Explanation (ci.yml)

### 1. Checkout Code
```yaml
- uses: actions/checkout@v3
```

### 2. Install Node
```yaml
- uses: actions/setup-node@v3
  with:
    node-version: 16
```

### 3. Run a Smoke Test
Makes sure the app runs briefly.

### 4. Build Docker Image
```yaml
- name: Build Docker image
  run: docker build -t ghcr.io/${{ github.repository_owner }}/lightning-devops-mini-pipeline:latest .
```

### 5. Log in to GHCR
```yaml
echo "${{ secrets.GITHUB_TOKEN }}" | docker login ghcr.io -u ${{ github.repository_owner }} --password-stdin
```

### 6. Push Image
```yaml
docker push ghcr.io/${{ github.repository_owner }}/lightning-devops-mini-pipeline:latest
```

---

## 🛠 Troubleshooting & Tips

### GHCR Image Not Appearing?
Make sure visibility is enabled under:  
**Settings → Packages → Visibility**

### Permission Denied in CI?
Make sure the workflow file includes:
```yaml
permissions:
  packages: write
  contents: read
```

### Docker Build Slow?
Enable build cache or switch to multi-stage builds.

---

## 🚧 Extending this Project
Here are ways to grow this into a full DevOps pipeline:

| Feature | Tech to Add |
|--------|--------------|
| Deploy to EC2 | Terraform + GitHub Actions |
| Deploy to Kubernetes | EKS + Helm |
| Add Monitoring | Prometheus + Grafana |
| Add Multi-Stage Docker | Prod vs Development images |
| Add Tests | Jest + Supertest |
| Add CD | GitHub Environments |

---

## 📜 License
This project is provided for educational and personal portfolio use.

---

## 👥 Contributors
- **wilson7777777** (Project owner & pipeline designer)
# Trigger CI
