#!/bin/bash

echo "🔻 A desmontar SLOT1 e SLOT2..."
sudo umount /media/svadmin/SLOT1
sudo umount /media/svadmin/SLOT2
echo "✅ Desmontados com sucesso."

echo "🔌 A montar SLOT1 e SLOT2..."
sudo mount -t exfat -o uid=1000,gid=1000,umask=0000 LABEL=SLOT1 /media/svadmin/SLOT1
sudo mount -t exfat -o uid=1000,gid=1000,umask=0000 LABEL=SLOT2 /media/svadmin/SLOT2
echo "✅ Montagem concluída."

echo "🌐 A reiniciar o serviço Samba..."
sudo systemctl restart smbd
echo "✅ Samba reiniciado. Partilhas disponíveis na rede."

echo "📂 Discos prontos e partilhados:"
lsblk -o NAME,LABEL,SIZE,MOUNTPOINT | grep SLOT


# chmod +x mountdisk.sh
# ./mountdisk.sh
