# Changelog
Todas las novedades de este proyecto se documentan aquí.

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
