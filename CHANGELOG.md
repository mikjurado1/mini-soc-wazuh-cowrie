# Changelog

## v0.3.0 – 2025-09-XX
- Publicación oficial del proyecto **Mini-SOC** en LinkedIn y GitHub.
- Añadida documentación de difusión en [`docs/publication.md`](./docs/publication.md) con capturas y resumen técnico.
- Evidencias finales organizadas y presentadas para reclutadores (Cowrie + Windows + Sysmon).
- Mejora del README con enlaces a publicaciones externas y métricas de visitas.
- Roadmap actualizado hacia Mes 2 (integración de IDS de red como Suricata/Zeek).


# 📜 CHANGELOG – Mini-SOC Wazuh + Cowrie + Sysmon

## v0.2.0 – 2025-09-03
- Añadido endpoint **Windows 10 (Win10-VM)** con **Sysmon + Wazuh Agent**.
- Configuración de `ossec.conf` para capturar el canal `Microsoft-Windows-Sysmon/Operational`.
- Evidencias documentadas en [`docs/evidence_win10.md`](./docs/evidence_win10.md).
- Queries de threat hunting añadidas en [`docs/hunting_win10.md`](./docs/hunting_win10.md).
- Exportado dashboard básico de Sysmon (`/dashboards/sysmon_basic.ndjson`).
- Roadmap actualizado en README.

## v0.1.0 – 2025-08-XX
- Versión inicial con Honeypot **Cowrie** integrado con Wazuh.
- Reglas locales para detección de `cowrie.login.failed` (MITRE T1110) y `cowrie.login.success` (MITRE T1078).
- Diagramas de arquitectura V1 en [`docs/architecture.md`](./docs/architecture.md).
- Dashboards NDJSON exportados para accesos fallidos y exitosos.
- Test Plan inicial (`docs/test-plan.md`) con escenarios reproducibles.


El formato sigue **Keep a Changelog** y el versionado es **SemVer**.

## [Unreleased]
### Added
- Reglas y ejemplos para `cowrie.command.input` y `cowrie.session.connect` (pendiente).
- `docs/test-plan.md` con validaciones paso a paso (pendiente).

## [v0.1.0] - 2025-09-02
### Added
- Reglas locales en `config/local_rules.xml` (IDs 100200–100201) con mapeo MITRE (T1110, T1078).
- Config de ejemplo `config/ossec.cowrie.sample.xml`.
- Exports importables (`.ndjson`) en `dashboards/`:
  - `cowrie_failed_logins.search.ndjson`
  - `cowrie_success_logins.search.ndjson`
- Documentación: `docs/architecture.md`, `docs/dashboards.md` y capturas en `docs/img/`.
- Muestras: `samples/cowrie.login.failed.json`, `samples/hydra_command.md`.
- Scripts de setup: `scripts/setup_honeypot.sh`, `scripts/setup_manager.sh`.

### Changed
- Renombrado `samples/hydra_command.txt` → `samples/hydra_command.md`.

### Notes
- Probado con Wazuh 4.x y Cowrie 2.x (Debian/Ubuntu). Ajustar rutas de logs según entorno.
