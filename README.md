# DevOps Node API with Docker & Git Workflow (CI/CD)

## Overview
This project is a **Node.js API** containerized with **Docker**, using a **Git branching workflow** (dev → staging → main) and automated **CI/CD pipelines** with **GitHub Actions**.

The purpose of this project is to practice **DevOps fundamentals**, including:

* Containerization with Docker
* Multi-branch Git workflow
* CI/CD automation (build, test, deploy)
* Development → Staging → Production flow
* Semantic versioning for production releases
---

# Project Architecture

Node.js API → Docker Container → GitHub Actions → Docker Hub → Deployment

Workflow Summary:
* Developer works in dev branch → pushes code → CI builds image → pushes to Docker Hub
* Merge dev → staging → CD pulls image from Docker Hub → deploys container in staging
* Merge staging → main + tag version vX.Y.Z → CD pulls image → deploys production container

---

# Technologies Used

* Node.js
* Docker and Docker Compose
* Git & GitHub
* GitHub Actions (CI/CD)
* Semantic Versioning for production releases

---

# Project Structure

```
devops-node-api/
│
├── Dockerfile
├── docker-compose.yml
├── package.json
├── server.js
└── .github/
    └── workflows/
        ├── docker-build.yml         # CI: build & push image from dev
        ├── cd-staging.yml           # CD: deploy to staging
        └── cd-main.yml              # CD: deploy to production using semantic versioning
```

---

# API Endpoint

```
GET /
```

Response:

```
Hello from Dockerized Node API!
```

---

# Running the Application (Local Development)

Build and run the container:

```
docker compose up --build
```

Test the API:

```
curl http://localhost:3000/
```

Expected response:

```
Hello from Dockerized Node API!
```

---

# Docker Setup

The application runs inside a Docker container.

Example base image:

```
node:18-alpine
```

Container responsibilities:

* Install dependencies
* Run Node server
* Support auto-reload using **nodemon**

---

# Development Workflow

This project uses a **Git branching strategy**.

```
dev → staging → main
```

Branch purposes:

| Branch  | Purpose                           |
| ------- | ----------------------------------|
| dev     | CI triggers                       |
| staging | CD for testing                    |
| main    | Production / CD with versioning   |

---

# Example Development Flow

1️⃣ Work in `dev` branch

```
git checkout dev
```

Make changes to the code.

---

2️⃣ Commit and push

```
git add .
git commit -m "update feature"
git push origin dev
```

---

3️⃣ Merge into staging

```
git checkout staging
git merge dev
git push origin staging
```

---

4️⃣ Release to production

```
git checkout main
git merge staging
git tag Vx.y.z
git push origin Vx.y.z
```

---

# CI/CD Pipeline (Basic Setup)

GitHub Actions workflows are included:

```
.github/workflows/
```

### CI Workflow

Runs when pushing to:

```
dev branch
```

Triggered on push to dev
* Workflow:
    * Checkout code
    * Install dependencies
    * Build Docker image
    * Push Docker image to Docker Hub with:
      * staging tag (for staging testing)
      * commit SHA tag (for traceability)

---

### CD Workflow

Runs when pushing to:

```
staging branch
```

Trigger: push to staging branch
* Runs on: self-hosted runner (VBOX)
* Workflow:
    * Pull latest Docker image from Docker Hub
    * Stop & remove old container (if exists)
    * Run new container in staging

---

### CD Workflow

Runs when pushing to:

```
Main branch
```

Triggered on push tag vX.Y.Z on main
* Runs on: self-hosted runner (VBOX)
* Workflow:
    * Pull Docker image tagged with semantic version
    * Stop & remove old container (if exists)
    * Run new container in production
* Workflow ensures production is always stable & versioned

---

# Semantic Versioning

Production releases use version tags:

```
v1.0.0, v1.0.1, v1.1.0, etc.
```
* Tags are created manually during release
* GitHub Actions triggers production deployment only on version tags
* Ensures traceable, stable production releases

---

# Learning Goals

This project was built to practice:

* Dockerizing a Node.js application
* Git multi-branch workflows
* CI/CD automation using GitHub Actions
* Semantic versioning for production
* DevOps development flow simulation on self-hosted runner (VBOX)

---

# Future Improvements

* Add automated tests for CI
* Add environment variables for configuration
* Setup monitoring/logging for staging & production
* Support multiple environments with dynamic tags
* Integrate rollback strategy for production releases

---

# Author

Paul Kusuma
