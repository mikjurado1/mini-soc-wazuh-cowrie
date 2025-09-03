
## 🏗️ Arquitectura (Mermaid)
```mermaid
flowchart LR
  A[Kali - Atacante] -- SSH:2222/Hydra --> B[Cowrie Honeypot<br/>192.168.229.134]
  B -- Logs (cowrie.log / cowrie.json) --> C[Wazuh Agent<br/>en 192.168.229.134]
  C -- TCP/1514,1515 --> D[Wazuh Manager + Dashboard<br/>192.168.229.133]
  D --> E[Threat Hunting / Reglas / Dashboards]
```


