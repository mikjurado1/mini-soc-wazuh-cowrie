# Evidencias – Suricata IDS

Estas son algunas evidencias de ataques simulados detectados por Suricata y enviados a Wazuh:

- **DHCP/Kali Detection**  
  Firma: `ET INFO Possible Kali Linux hostname in DHCP Request Packet`  
  ![Alerta Suricata Kali](img/suricata_kali_alert.png)

- **APT/HTTP User-Agent**  
  Firma: `ET INFO GNU/Linux APT User-Agent Outbound likely related to package management`  
  ![Alerta Suricata APT](img/suricata_apt_alert.png)

- **Tráfico sospechoso escaneo Nmap**  
  Firma: `ET SCAN Nmap Scripting Engine`  
  (pendiente de incluir captura si la tienes)
