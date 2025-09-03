# Evidencias – Windows 10 + Sysmon

## Agente activo
![Agente activo](../evidence/win10/agent_active.md)

## Sysmon – Creación de proceso (EventID 1)
![ProcessCreate](../evidence/win10/sysmon_process.md)
JSON: [`sysmon_process.json`](../evidence/win10/sysmon_process.json)

## Sysmon – Servicio/arranque modificado (EventID 4/12/13/7040 W.Event)
![Service change](../evidence/win10/sysmon_service.md)

## Sysmon – Intentos de descubrimiento / logon fallido
![Discovery / Logon failed](../evidence/win10/sysmon_logon_failed.md)

### MITRE mapeado visto en el lab
- T1059.001 (PowerShell – ejecución)
- T1087 (Account Discovery – `net.exe`)
- T1105 (C2/transferencia de ficheros via PowerShell)
