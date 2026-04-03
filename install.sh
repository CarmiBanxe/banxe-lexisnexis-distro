#!/bin/bash
# Collective LexisNexis - Installation Script
# Version: 1.0.0
# Usage: bash install.sh

set -e

echo "========================================"
echo "  Collective LexisNexis - Installer"
echo "  AI Compliance & Knowledge Platform"
echo "========================================"
echo ""

# Check prerequisites
check_prerequisites() {
    echo "[1/6] Checking prerequisites..."
    
    if ! command -v docker &> /dev/null; then
        echo "ERROR: Docker is not installed."
        echo "Install: https://docs.docker.com/get-docker/"
        exit 1
    fi
    
    if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
        echo "ERROR: Docker Compose is not installed."
        exit 1
    fi
    
    echo "  Docker: OK"
    echo "  Docker Compose: OK"
}

# Setup environment
setup_env() {
    echo "[2/6] Setting up environment..."
    
    if [ ! -f .env ]; then
        cp .env.example .env
        echo "  Created .env from template"
        echo "  IMPORTANT: Edit .env with your settings before starting!"
    else
        echo "  .env already exists, keeping current config"
    fi
}

# Create data directories
create_dirs() {
    echo "[3/6] Creating data directories..."
    
    mkdir -p data/knowledge-base
    mkdir -p data/compliance-rules
    mkdir -p data/legal-templates
    mkdir -p logs
    
    echo "  Directories created"
}

# Build services
build_services() {
    echo "[4/6] Building services (this may take a few minutes)..."
    docker compose build --no-cache
    echo "  All services built"
}

# Pull AI model
setup_ai() {
    echo "[5/6] Setting up AI model..."
    
    docker compose up -d ollama
    sleep 5
    
    echo "  Pulling default model (llama3.1:8b)..."
    docker exec lexis-ollama ollama pull llama3.1:8b
    echo "  AI model ready"
}

# Start everything
start_services() {
    echo "[6/6] Starting all services..."
    docker compose up -d
    
    echo ""
    echo "========================================"
    echo "  Installation complete!"
    echo "========================================"
    echo ""
    echo "  Web UI:      http://localhost:3000"
    echo "  API:         http://localhost:8000"
    echo "  Knowledge:   http://localhost:8001"
    echo "  Compliance:  http://localhost:8002"
    echo "  Legal:       http://localhost:8003"
    echo "  MiroFish:    http://localhost:8004"
    echo ""
    echo "  To stop:     docker compose down"
    echo "  To update:   bash update.sh"
    echo "  Logs:        docker compose logs -f"
    echo ""
}

# Run installation
check_prerequisites
setup_env
create_dirs
build_services
setup_ai
start_services
