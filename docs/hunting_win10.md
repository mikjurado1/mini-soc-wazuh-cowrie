# 🔍 Threat Hunting – Windows 10 + Sysmon

Queries útiles en Wazuh/Kibana para detectar actividad sospechosa en el endpoint **Win10-VM**.

## Procesos creados (EventID 1)
```
agent.name:"Win10-VM" AND data.win.system.eventID:"1"
```

## Conexiones de red (EventID 3)
```
agent.name:"Win10-VM" AND data.win.system.eventID:"3"
```

## Creación de archivos (EventID 11)
```
agent.name:"Win10-VM" AND data.win.system.eventID:"11"
```

## Logons exitosos/ fallidos (Security Log)
- Exitoso (4624):
```
agent.name:"Win10-VM" AND data.win.system.eventID:"4624"
```

- Fallido (4625):
```
agent.name:"Win10-VM" AND data.win.system.eventID:"4625"
```

## Creación de usuario local (Security Log – 4720)
```
agent.name:"Win10-VM" AND data.win.system.eventID:"4720"
```


---
