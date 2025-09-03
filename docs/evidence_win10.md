# Evidencias – Windows 10 + Sysmon

## Agente activo
<img width="1912" height="516" alt="image" src="https://github.com/user-attachments/assets/6e2f8776-a4b7-477e-9ee7-2b878fc753a4" />


## Sysmon – Creación de proceso (EventID 1)
---
<img width="1900" height="917" alt="image" src="https://github.com/user-attachments/assets/23ffbb27-43ec-4c73-b8e6-d6e4cf185987" />
---
<img width="1901" height="829" alt="image" src="https://github.com/user-attachments/assets/fcd5b51a-8aac-4319-990c-d5a7cb782676" />

---
JSON: [`sysmon_process.json`](evidence/win10/sysmon_process.json)

## Sysmon – Servicio/arranque modificado (EventID 4/12/13/7040 W.Event)
---
<img width="1894" height="918" alt="image" src="https://github.com/user-attachments/assets/3631fc00-88f3-4797-b0c7-f2eac072c8b8" />
---
<img width="1902" height="808" alt="image" src="https://github.com/user-attachments/assets/d090b2d1-772f-47cc-a5ab-65fd72b5fc54" />

---
## Sysmon – Intentos de descubrimiento / logon fallido
---
<img width="1902" height="921" alt="image" src="https://github.com/user-attachments/assets/b8c9306c-7c16-4064-8741-7913e885e0aa" />
---
<img width="1906" height="825" alt="image" src="https://github.com/user-attachments/assets/477b6d94-27d5-49a0-b008-113641cc4a86" />

---
### MITRE mapeado visto en el lab
- T1059.001 (PowerShell – ejecución)
- T1087 (Account Discovery – `net.exe`)
- T1105 (C2/transferencia de ficheros via PowerShell)
