# Consultas útiles para Threat Hunting (Wazuh/Elastic)

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
<img width="1913" height="920" alt="image" src="https://github.com/user-attachments/assets/1ea04e77-197f-4327-aa40-14b1e87a1760" />


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

