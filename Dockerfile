# Multi-stage Dockerfile for Flask CI/CD App

# Stage 1: Build stage
FROM python:3.12-slim as builder

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Stage 2: Runtime stage
FROM python:3.12-slim

WORKDIR /app

# Copy Python dependencies from builder stage
COPY --from=builder /root/.local /root/.local

# Copy application code
COPY app/ ./app/
COPY requirements.txt .

# Set PATH to use local python packages
ENV PATH=/root/.local/bin:$PATH

# Expose the port Flask runs on
EXPOSE 5000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')"

# Run the application
CMD ["python", "app/main.py"]
