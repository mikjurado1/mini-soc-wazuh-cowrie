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



```

## Comandos ejecutados en sesión (Cowrie)
```
data.eventid: "cowrie.command.input"
```

## Éxito de login (posible compromiso)
```
data.eventid: "cowrie.login.success"
```
<img width="1919" height="918" alt="image" src="https://github.com/user-attachments/assets/01524067-274d-4e35-895b-229e265ea520" />

<img width="1910" height="872" alt="image" src="https://github.com/user-attachments/assets/8dfa9d23-4cf7-4c20-a27a-e45e033ed49a" />

