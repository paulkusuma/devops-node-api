# DevOps Node API with Docker & Git Workflow

## Overview

This project is a simple **Node.js API** that is containerized using **Docker** and managed with a **Git branching workflow** (`dev → staging → main`).

The purpose of this project is to practice **DevOps fundamentals**, including:

* Containerization with Docker
* Multi-branch Git workflow
* Development → Staging → Production flow
* Basic CI/CD preparation with GitHub Actions

---

# Project Architecture

Node.js API → Docker Container → Docker Compose → Git Branch Workflow → GitHub Actions

---

# Technologies Used

* Node.js
* Docker
* Docker Compose
* Git & GitHub
* GitHub Actions (CI/CD)

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
        ├── ci-dev.yml
        └── cd-staging.yml
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

| Branch  | Purpose               |
| ------- | --------------------- |
| dev     | Development work      |
| staging | Testing environment   |
| main    | Production-ready code |

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

4️⃣ Test staging environment

```
docker compose up --build
curl http://localhost:3000/
```

---

5️⃣ Release to production

```
git checkout main
git merge staging
git push origin main
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

Purpose:

* Install dependencies
* Build the project
* Ensure code compiles correctly

---

### CD Workflow

Runs when pushing to:

```
staging branch
```

Purpose:

* Build Docker image
* Prepare deployment pipeline

---

# Learning Goals

This project was built to practice:

* Dockerizing a Node.js application
* Git multi-branch workflows
* CI/CD automation using GitHub Actions
* DevOps development flow

---

# Future Improvements

Possible next steps:

* Push Docker image to Docker Hub
* Automatic deployment to a server
* Add automated testing
* Use environment variables
* Add monitoring/logging

---

# Author

Paul Kusuma
DevOps Learning Project
