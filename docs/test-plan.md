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
