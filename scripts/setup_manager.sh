#!/bin/bash
# setup_manager.sh - Instalación de Wazuh Manager y Dashboard en Ubuntu 22.04
# Uso: sudo ./scripts/setup_manager.sh

set -e

echo "[*] Actualizando paquetes..."
apt-get update && apt-get upgrade -y

echo "[*] Instalando dependencias..."
apt-get install -y curl apt-transport-https unzip

echo "[*] Añadiendo repositorio de Wazuh..."
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --dearmor -o /usr/share/keyrings/wazuh.gpg
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | tee /etc/apt/sources.list.d/wazuh.list

echo "[*] Instalando Wazuh Manager y Dashboard..."
apt-get update
apt-get install -y wazuh-manager wazuh-indexer wazuh-dashboard

echo "[*] Habilitando y arrancando servicios..."
systemctl daemon-reload
systemctl enable wazuh-manager
systemctl enable wazuh-indexer
systemctl enable wazuh-dashboard

systemctl start wazuh-manager
systemctl start wazuh-indexer
systemctl start wazuh-dashboard

echo "[+] Instalación de Wazuh Manager completada."
echo "Accede al dashboard en: https://<IP_DEL_MANAGER>:443"
