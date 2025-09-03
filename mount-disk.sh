#!/bin/bash

# Diretórios de montagem
DIR1="/mnt/disco1tb"
DIR2="/mnt/disco2tb"

# UUID do disco 1TB (ext4)
UUID1="adbbb6c6-9bfb-45b3-94a9-f2668318c767"
# Disco 2TB montado por /dev/sdc1 (exFAT)
DISCO2="/dev/sdc1"

# Criar diretórios de montagem se não existirem
sudo mkdir -p "$DIR1"
sudo mkdir -p "$DIR2"

# Montar disco 1TB (ext4)
if grep -qs "$DIR1" /proc/mounts; then
  echo "✅ Disco 1TB já está montado em $DIR1."
else
  echo "🔄 A montar disco 1TB..."
  sudo mount UUID=$UUID1 "$DIR1" && echo "✅ Disco 1TB montado!"
fi

# Montar disco 2TB (exFAT)
if grep -qs "$DIR2" /proc/mounts; then
  echo "✅ Disco 2TB já está montado em $DIR2."
else
  echo "🔄 A montar disco 2TB..."
  sudo mount -t exfat -o uid=1000,gid=1000,umask=0000 "$DISCO2" "$DIR2" && echo "✅ Disco 2TB montado!"
fi
