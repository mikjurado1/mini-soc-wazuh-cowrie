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



## 🔹 Sysmon (Windows 10)

- **Dashboards exportados:**
  - `Sysmon_LogonFailure.ndjson`
  - `Sysmon_ProcessCreate.ndjson`
  - `ServiceStartupChange.ndjson`

- **Descripción:**
  - **Logon Failure** → muestra intentos de inicio de sesión fallidos (EventID 4625).  
  - **Process Create** → visualiza procesos ejecutados (EventID 1, `powershell.exe`, `cmd.exe`).  
  - **Service Startup Change** → identifica modificaciones en servicios (EventID 7045).

- **Ejemplo de captura:**  
<img width="1901" height="917" alt="image" src="https://github.com/user-attachments/assets/156a9fb4-84e4-4480-bbe9-f414e68198bc" />

<img width="1900" height="900" alt="image" src="https://github.com/user-attachments/assets/745d1fd7-d544-4f3c-a2e5-3264c4528bcb" />

---

## 🔹 Suricata (IDS de Red)

- **Dashboard exportado:**
  - (Pendiente de añadir export → por ahora se ven en alertas Suricata en `alerts.json`)

- **Descripción:**
  - Visualiza alertas de red (`event_type: alert`), como:
    - Escaneos Nmap detectados.  
    - User-Agent sospechoso (`sqlmap`, `Nmap NSE`).  
    - DNS tunneling / tráfico anómalo.  

- **Ejemplo de captura:**  
<img width="1902" height="921" alt="image" src="https://github.com/user-attachments/assets/9ef6b988-9c90-4764-bc48-bdfc63ac2674" />

<img width="1904" height="750" alt="image" src="https://github.com/user-attachments/assets/4710c81c-735f-436a-b9c6-41e6946b1d8b" />


---

## 🔹 Rootcheck (Integridad de Archivos)

- **Dashboard interno de Wazuh** (no exportado como NDJSON).  
- **Descripción:**
  - Muestra alertas de integridad en archivos críticos.  
  - Ejemplo: detección de binario `/bin/passwd` alterado (Trojaned).  

- **Ejemplo de captura:**  
<img width="1899" height="920" alt="image" src="https://github.com/user-attachments/assets/2c8b19d3-3632-4658-a666-e725aae6c0dc" />

<img width="1896" height="732" alt="image" src="https://github.com/user-attachments/assets/9cffd725-7bfe-4deb-8ce8-1b80890fc576" />


---

## 📌 Próximos pasos

- Integrar todos los dashboards en un **overview unificado** para tener una visión 360º (ataques SSH, escaneos de red, actividad endpoint).
- Añadir export en `dashboards/suricata_alerts.ndjson` cuando esté listo.
