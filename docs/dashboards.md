# Consultas útiles para Threat Hunting (Wazuh/Elastic)

## Solo eventos del honeypot
```
agent.name: "honeypot"
```

## Intentos de login fallidos (Cowrie)
```
data.eventid: "cowrie.login.failed"
```

## Comandos ejecutados en sesión (Cowrie)
```
data.eventid: "cowrie.command.input"
```

## Éxito de login (posible compromiso)
```
data.eventid: "cowrie.login.success"
```
