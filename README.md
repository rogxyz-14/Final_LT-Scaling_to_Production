# Flask CI/CD Application

A beginner-friendly Flask application demonstrating modern CI/CD practices with GitHub Actions, Docker, and automated testing.

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── ci.yml                 # GitHub Actions CI/CD pipeline
├── app/
│   └── main.py                    # Flask application
├── tests/
│   └── test_main.py               # Unit tests
├── Dockerfile                      # Multi-stage Docker build
├── requirements.txt                # Python dependencies
└── README.md                       # This file
```

## Getting Started

### Local Development

1. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

2. **Run the app:**
   ```bash
   python app/main.py
   ```
   The app runs on `http://localhost:5000`

3. **Run tests locally:**
   ```bash
   pytest tests/
   ```

4. **Check code style:**
   ```bash
   flake8 app/
   ```

## API Endpoints

- `GET /` - Hello endpoint
  ```bash
  curl http://localhost:5000/
  ```
  Response: `{"message": "Hello from Flask CI/CD App!"}`

- `GET /health` - Health check endpoint
  ```bash
  curl http://localhost:5000/health
  ```
  Response: `{"status": "ok"}`

## CI/CD Pipeline

This project uses GitHub Actions for automated:

1. **Continuous Integration (CI)** - Lint & Test
   - Checks code style with `flake8`
   - Runs unit tests with `pytest`
   - Only proceeds if all checks pass

2. **Continuous Delivery (CD)** - Build & Deploy
   - Builds and pushes Docker image to GitHub Container Registry (GHCR)
   - Deploys to production server via SSH

### Pipeline Flow

```
git push to main
    ↓
[CI] Lint & Test (~30s)
    ↓ All passed?
[CD] Build Docker Image (~1-2 min)
    ↓ Image ready?
[CD] Deploy to Server (~30s)
    ↓
App is live!
```

## Docker

### Build the image locally

```bash
docker build -t my-app .
```

### Run the container

```bash
docker run -d --name my-app -p 5000:5000 my-app
```

### View logs

```bash
docker logs -f my-app
```

## Learning Objectives

By completing this project, you'll learn:

- ✅ **What is CI/CD?** - Automated testing and deployment
- ✅ **GitHub Actions** - GitHub's built-in CI/CD platform
- ✅ **Docker** - Containerizing applications
- ✅ **Testing** - Unit tests and code quality checks
- ✅ **Deployment** - Automated server updates
- ✅ **Secrets Management** - Secure credential handling

## Key Files Explained

### `.github/workflows/ci.yml`
Defines the GitHub Actions pipeline:
- Triggers on `push` to `main` branch
- Runs 3 jobs: lint & test → build docker → deploy
- Uses GitHub Secrets for secure credentials

### `Dockerfile`
Multi-stage build for optimal image size:
- Stage 1: Install dependencies
- Stage 2: Copy only necessities, run app

### `requirements.txt`
Python dependencies:
- `flask` - Web framework
- `pytest` - Testing framework
- `flake8` - Code style checker

## Common Commands

```bash
# Git workflow
git add .
git commit -m "Your message"
git push origin main

# View GitHub Actions logs
# Go to https://github.com/rogxyz-14/Final_LT-Scaling_to_Production/actions

# Test locally
pytest -v tests/

# Style check
flake8 app/ --max-line-length=100
```

## Troubleshooting

| Issue | Cause | Solution |
|-------|-------|----------|
| Pipeline doesn't run | YAML file not in `.github/workflows/` | Check the exact path |
| Tests fail in CI but pass locally | Python version mismatch | Verify Python version in CI workflow |
| Docker build fails | Missing dependencies | Check `requirements.txt` |
| Deploy fails | SSH secret not configured | Add secrets to GitHub repo settings |

## Resources

- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Docker Docs](https://docs.docker.com/)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [Pytest Documentation](https://docs.pytest.org/)

## Next Steps

1. ✅ Set up local development environment
2. ✅ Run tests locally to ensure they pass
3. ✅ Push code to GitHub and monitor CI pipeline
4. ✅ Fix any pipeline failures
5. 🔄 Add deployment secrets and enable auto-deployment

---

**Learning Path:** Phase 4 - Scaling to Production | Week 11 - DevOps & CI/CD Pipelines
