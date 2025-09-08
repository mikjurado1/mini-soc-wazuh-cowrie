# Consultas útiles para Threat Hunting (Wazuh/Elastic)

# 📊 Dashboards – Mini-SOC Wazuh

Este laboratorio cuenta con varios dashboards creados en Kibana/Wazuh y exportados en formato **NDJSON**.  
Cada dashboard corresponde a un caso de uso específico (Cowrie, Sysmon, Suricata) y sirve para visualizar evidencias de ataques simulados.


## Solo eventos del honeypot
```
agent.name: "honeypot"
```
<img width="1919" height="918" alt="image" src="https://github.com/user-attachments/assets/7f5253cb-5825-4d8e-afe1-ab9531eff67b" />

<img width="1907" height="827" alt="image" src="https://github.com/user-attachments/assets/1cd97555-9953-49f2-957b-8a0145e78fbc" />




## Intentos de login fallidos (Cowrie)
```
data.eventid: "cowrie.login.failed"
```
<img width="1919" height="919" alt="image" src="https://github.com/user-attachments/assets/cf4a7ed1-fa54-4c4c-a5ce-63fb149d8677" />

<img width="1918" height="572" alt="image" src="https://github.com/user-attachments/assets/35f020ba-4a89-4311-8afd-af7a24d8336c" />

## Comandos ejecutados en sesión (Cowrie)
```
data.eventid: "cowrie.command.input"
```

## Éxito de login (posible compromiso)
```
data.eventid: "cowrie.login.success"
```
<img width="1919" height="912" alt="image" src="https://github.com/user-attachments/assets/4cbf8eba-1594-4637-96b1-6aa3d6ebcb56" />

<img width="1916" height="822" alt="image" src="https://github.com/user-attachments/assets/38be6fb9-6fbd-46bf-aa31-fd9268cc4554" />
