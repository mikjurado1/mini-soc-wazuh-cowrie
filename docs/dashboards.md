# Consultas útiles para Threat Hunting (Wazuh/Elastic)

## Solo eventos del honeypot
```
agent.name: "honeypot"
```
<img width="1919" height="834" alt="image" src="https://github.com/user-attachments/assets/ab6dd500-8c38-41cb-a419-02b4b5cb4d28" />

<img width="1903" height="656" alt="image" src="https://github.com/user-attachments/assets/e673dc56-1760-4a65-bcea-69b588f82a1c" />



## Intentos de login fallidos (Cowrie)
```
data.eventid: "cowrie.login.failed"
<img width="1919" height="842" alt="image" src="https://github.com/user-attachments/assets/5f82df2c-3cda-4493-82e2-0b3ee83defa2" />


```

## Comandos ejecutados en sesión (Cowrie)
```
data.eventid: "cowrie.command.input"
```

## Éxito de login (posible compromiso)
```
data.eventid: "cowrie.login.success"
```
