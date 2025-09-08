# Evidencias – Suricata IDS

Estas son algunas evidencias de ataques simulados detectados por Suricata y enviados a Wazuh:

- **DHCP/Kali Detection**  
  Firma: `ET INFO Possible Kali Linux hostname in DHCP Request Packet`  
<img width="1892" height="739" alt="image" src="https://github.com/user-attachments/assets/0c829226-7c8c-4407-b161-ad178fbc38a1" />


- **APT/HTTP User-Agent**  
  Firma: `ET INFO GNU/Linux APT User-Agent Outbound likely related to package management`  
<img width="1902" height="741" alt="image" src="https://github.com/user-attachments/assets/3cdc774d-5b09-4b9b-968a-033971c08cc6" />

- **Tráfico sospechoso escaneo Nmap**  
  Firma: `ET INFO Possible Kali Linux hostname in DHCP Request Packet`  
<img width="1892" height="740" alt="image" src="https://github.com/user-attachments/assets/fb74e68d-5999-4b8a-bf4e-50c9d41714ec" />


## 🛠️ Ataques simulados y alertas generadas

- **Escaneo de red con Nmap**
  - **Comando ejecutado:**  
    ```bash
    nmap -sS -T4 -p1-1000 192.168.229.144
    ```
  - **Alerta generada:**  
    `ET INFO Possible Kali Linux hostname in DHCP Request Packet`
  - **Severidad:** 3  
  - **Log fuente:** `/var/log/suricata/eve.json`

---

- **Tráfico HTTP con User-Agent sospechoso**
  - **Comando ejecutado:**  
    ```bash
    curl -A "sqlmap" http://192.168.229.144
    ```
  - **Alerta generada:**  
    `ET INFO GNU/Linux APT User-Agent Outbound likely related to package management`
  - **Severidad:** 3  
  - **Log fuente:** `/var/log/suricata/eve.json`

---

- **Consulta DNS sospechosa**
  - **Comando ejecutado:**  
    ```bash
    dig test.malwaredomain.com @192.168.229.144
    ```
  - **Alerta generada:**  
    `ET INFO Possible DNS Tunneling Attempt`
  - **Severidad:** 2–3  
  - **Log fuente:** `/var/log/suricata/eve.json`

