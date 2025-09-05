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

---
### W1 – Ejecución PowerShell/Notepad (EventID 1)

<img width="1904" height="917" alt="image" src="https://github.com/user-attachments/assets/9ecd147f-b645-47c3-8827-5a50e7a0377a" />


---
### W2 – Intentos fallidos de login (EventID 4625)

<img width="1902" height="918" alt="image" src="https://github.com/user-attachments/assets/8c33134a-d55e-4cd2-a306-38ad1fd43191" />


---
### W3 – Eliminación de usuario local (EventID 4720)
<img width="1900" height="745" alt="image" src="https://github.com/user-attachments/assets/f854fbb1-b073-43e0-82eb-d72ba68c2054" />

---
### W4 – Falso positivo (EventID 11 – cleanmgr.exe)

<img width="1899" height="855" alt="image" src="https://github.com/user-attachments/assets/4f5de7d4-c9b7-431a-90e4-3c5df0de39c1" />


<img width="1907" height="864" alt="image" src="https://github.com/user-attachments/assets/3c3c92e7-e2ae-43d8-9e75-5f13ffe8092d" />
