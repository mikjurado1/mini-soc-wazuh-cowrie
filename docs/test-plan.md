# Test Plan — Mini-SOC Wazuh + Cowrie

## Objetivo
Validar que el honeypot Cowrie genera eventos que el agente Wazuh recoge, decodifica y correlaciona con reglas locales (MITRE) y que las búsquedas/paneles importados (NDJSON) permiten observar los incidentes.

## Alcance
- Eventos cubiertos:
  - `cowrie.login.failed` → **Regla 100200** (MITRE T1110 – Brute Force)
  - `cowrie.login.success` → **Regla 100201** (MITRE T1078 – Valid Accounts)
- (Opcional / Próxima versión)
  - `cowrie.command.input` → Regla a definir (MITRE según el comando)
  - `cowrie.session.connect` → Regla a definir

## Prerrequisitos
- Infra:
  - Manager Wazuh funcionando y accesible.
  - VM/host **honeypot** con Cowrie y **wazuh-agent** registrados.
- Config:
  - Reglas locales en `config/local_rules.xml` cargadas.
  - Cowrie enviando logs en JSON (p. ej. `/var/log/cowrie/cowrie.json`) y el `ossec.conf` con `<localfile>` apuntando a ese fichero.
- Importables:
  - Importar los NDJSON de `dashboards/`:
    - `cowrie_failed_logins.search.ndjson`
    - `cowrie_success_logins.search.ndjson`

> **Nota**: Ajusta IPs/puertos según tu entorno. En Cowrie, el SSH suele estar en `2222`.

---

## Matriz de pruebas

| ID | Escenario | Generación de evento | Esperado en Wazuh | MITRE | Evidencia |
|----|-----------|----------------------|-------------------|-------|----------|
| T1 | Brute force (fallos) | Ataques SSH con `hydra` (varias contraseñas) | Alertas con `rule.id=100200` y `data.eventid=cowrie.login.failed` | T1110 | Capturas búsqueda + detalle alerta |
| T2 | Acceso válido (éxito) | Login SSH simulado a Cowrie | Alertas con `rule.id=100201` y `data.eventid=cowrie.login.success` | T1078 | Capturas búsqueda + detalle alerta |
| T3* | Comandos dentro de sesión | Ejecutar comandos (p. ej. `uname -a`, `cat /etc/passwd`) | Evento `cowrie.command.input` (+ regla si existe) | Según comando | Capturas |
| T4* | Conexión de sesión | Abrir/cerrar sesión SSH | Evento `cowrie.session.connect` (+ regla si existe) | — | Capturas |

\* T3/T4 son opcionales si aún no creaste esas reglas.

---

## T1 — Brute Force (fallos de login)
**Propósito:** Disparar `cowrie.login.failed` y validar la **Regla 100200** (MITRE T1110).

1. Desde la máquina atacante (p. ej. Kali), ejecuta **Hydra**. Revisa `samples/hydra_command.md` o usa:

   ```bash
   hydra -l root -P /usr/share/wordlists/rockyou.txt -s 2222 ssh://<IP_HONEYPOT> -t 4 -f
   ```
2. Verifica eventos en Wazuh:
  - Saved search importada: Cowrie Failed Logins.
  - Filtro de referencia:
```
agent.name:"honeypot" AND data.eventid:"cowrie.login.failed"
```

3. Esperado:
   - Alerta con rule.id=100200.
   - Mensaje similar a: login attempt failed.
   - En detalles de la alerta: mapeo MITRE T1110 (Brute Force).

4. Evidencia:
   - Captura del listado de eventos (saved search).
   - Captura del detalle de una alerta (panel lateral) mostrando rule.id, data.eventid, usuario/IP origen y MITRE.

T2 — Acceso válido (login success)

Propósito: Disparar `cowrie.login.success` y validar la **Regla 100201 (MITRE T1078)**.

1. Desde un host externo, intenta sesión SSH contra Cowrie:

```bash
ssh -p 2222 root@<IP_HONEYPOT>
# introduce alguna contraseña (p. ej. monkey)
# sal de la sesión con 'exit'
```
> Cowrie puede aceptar credenciales según su configuración; el objetivo es generar el evento de éxito.

2. Verifica eventos:
   - Saved search importada: Cowrie Success Logins.
   - Filtro de referencia:
```
agent.name:"honeypot" AND data.eventid:"cowrie.login.success"
```

3. Esperado:
   - Alerta con `rule.id=100201`.
   - En detalles: **MITRE T1078 (Valid Accounts).**

4. Evidencia:
   - Captura del listado de eventos.
   - Captura del detalle con `rule.id` y **MITRE**.

(Opcional) T3 — Comandos dentro de sesión

**Propósito:** Registrar `cowrie.command.input` (y correlacionar si existe regla).

1. Abre sesión SSH como en T2 y ejecuta:
```
uname -a
whoami
cat /etc/passwd
exit
```

2. Filtro:
```
agent.name:"honeypot" AND data.eventid:"cowrie.command.input"
```

3. Esperado:
   - Eventos con el comando en el campo correspondiente (p. ej. `data.command`).
   - (Si hay regla local) alerta con severidad definida y mapeo MITRE según el comando.

4. Evidencia: capturas de resultados.

(Opcional) T4 — Conexión de sesión

Propósito: Registrar `cowrie.session.connect`.

1. Intenta una conexión SSH y cuélgala (o inicia y sal rápido):
```
ssh -p 2222 root@<IP_HONEYPOT> "exit" || true
```

2. Filtro:
```
agent.name:"honeypot" AND data.eventid:"cowrie.session.connect"
```

3. Esperado: evento de conexión con IP origen.

4. Evidencia: captura.

Verificación adicional (host honeypot)

- Asegúrate de que Cowrie está escribiendo JSON:
```
sudo tail -n 50 /var/log/cowrie/cowrie.json
```

- Si el agente Wazuh lee el archivo correcto, deberían aparecer líneas nuevas al generar eventos.

Criterios de aceptación (Pass/Fail)

- PASS si:

   - T1: se observan alertas con rule.id=100200 para fallos de login, con MITRE T1110.

   - T2: se observan alertas con rule.id=100201 para logins exitosos, con MITRE T1078.

   - Los saved searches importados devuelven resultados coherentes con los ataques.

 - Opcional: evidencias para T3/T4 si esas reglas se añaden.

 - FAIL si cualquiera de las condiciones anteriores no se cumple o no hay eventos/alertas tras ejecutar los pasos.

Evidencias a adjuntar en docs/img/

- `search_failed_logins.png` — listado y filtro.

- `alert_failed_login_detail.png` — detalle alerta 100200.

- `search_success_logins.png` — listado y filtro.

- `alert_success_login_detail.png` — detalle alerta 100201.

- (Opcional) `command_input_list.png`, `session_connect_list.png`.

Troubleshooting rápido

- No llegan eventos:

  - Verifica que el agente está conectado al manager (`/var/ossec/logs/ossec.log`).

  - Revisa puertos 1514/1515 TCP/UDP entre agente y manager.

  - Asegura `<localfile>` apuntando a `cowrie.json` y formato `json`.

- No se aplican reglas:

  - Confirma carga de `local_rules.xml` (sin errores de sintaxis).

  - Reinicia el manager y el agente tras cambios de config.

- Saved searches vacías:

   - Confirma que importaste los .ndjson.

   - Ajusta el timepicker al rango donde generaste los ataques.

   - Revisa el campo agent.name (usa el nombre real del agente).

Anexo — Comandos de referencia

- Hydra (rápido, diccionario pequeño):
```
printf "123456\npassword\nmonkey\nletmein\n" > pass.txt
hydra -l root -P pass.txt -s 2222 ssh://<IP_HONEYPOT> -t 4 -f
```

- SSH directo:
```
ssh -p 2222 root@<IP_HONEYPOT>
```
