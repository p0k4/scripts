#!/bin/bash

echo "==============================="
echo "📦 DEPLOY INICIADO: $(date)"
echo "==============================="

# Caminho base (ajusta se estiveres noutro diretório)
PROJECT_DIR="$(pwd)"
ENV_BACKEND="$PROJECT_DIR/backend/.env"

# 🔧 Verifica se Colima está ativo
if ! colima status | grep -q "Running"; then
  echo "🚀 Colima não está a correr. A iniciar..."
  colima start --cpu 4 --memory 6g --disk 50g
fi

# 🔐 Verifica se o .env do backend existe
if [ ! -f "$ENV_BACKEND" ]; then
  echo "⚠️  .env do backend não existe. A criar um de exemplo..."
  cat <<EOF > "$ENV_BACKEND"
PORT=4000
DATABASE_URL=postgresql://martins:bdrn.admin@postgres:5432/rnv_db
EOF
  echo "✅ .env criado com valores padrão."
fi

# 🧹 Limpa containers anteriores
echo "🧹 A parar containers antigos..."
docker compose down

# 🐳 Build + Up
echo "🐳 A construir e iniciar containers..."
docker compose up --build -d

# 📡 Espera uns segundos para subir tudo
echo "⏳ Aguardar 5 segundos..."
sleep 5

# 🔎 Logs (opcional: comenta se não quiseres)
echo "📜 LOGS do backend (Ctrl+C para sair)"
docker logs -f app_alunos-backend-1
