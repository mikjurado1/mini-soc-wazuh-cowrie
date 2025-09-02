#!/bin/bash
# setup_honeypot.sh - Instalación de Cowrie Honeypot en Debian/Ubuntu
# Uso: sudo ./scripts/setup_honeypot.sh

set -e

echo "[*] Actualizando paquetes..."
apt-get update && apt-get upgrade -y

echo "[*] Instalando dependencias..."
apt-get install -y git python3 python3-venv python3-pip libssl-dev libffi-dev build-essential authbind

echo "[*] Clonando Cowrie..."
cd /opt
git clone https://github.com/cowrie/cowrie.git
cd cowrie

echo "[*] Configurando entorno virtual..."
python3 -m venv cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "[*] Configurando Cowrie..."
cp etc/cowrie.cfg.dist etc/cowrie.cfg
cp etc/userdb.example etc/userdb.txt

# Cambiar puerto SSH a 2222 en cowrie.cfg
sed -i 's/^listen_port = 2222/listen_port = 2222/' etc/cowrie.cfg

echo "[*] Creando servicio systemd..."
cat <<EOF > /etc/systemd/system/cowrie.service
[Unit]
Description=Cowrie Honeypot
After=network.target

[Service]
User=root
WorkingDirectory=/opt/cowrie
ExecStart=/opt/cowrie/cowrie-env/bin/python /opt/cowrie/bin/cowrie start
ExecStop=/opt/cowrie/cowrie-env/bin/python /opt/cowrie/bin/cowrie stop
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable cowrie
systemctl start cowrie

echo "[+] Cowrie Honeypot instalado y ejecutándose en el puerto 2222."
