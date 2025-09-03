#!/bin/bash

echo "==============================="
echo "📦 DEPLOY INICIADO: $(date)"
echo "==============================="

# Diretório base
echo -e "\n📂 Diretório atual:"
pwd

# Git status
echo -e "\n📄 Estado atual do Git:"
git status

# ✅ Garantir que Colima está a correr
echo -e "\n🐳 A iniciar Colima com config personalizada..."
colima start --cpu 4 --memory 6 --disk 50 --save-config

# Pull e build docker
echo -e "\n🔄 A puxar últimas alterações do repositório..."
git pull

echo -e "\n🧹 Parando container atual..."
docker compose down

echo -e "\n🐳 A construir e iniciar container Docker..."
docker compose up --build
