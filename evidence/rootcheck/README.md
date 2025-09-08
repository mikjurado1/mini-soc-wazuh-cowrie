# Evidencias – Rootcheck

Ejemplo de detección de anomalías en integridad de archivos:

- **Binario Trojanizado**  
  Alerta: `Trojaned version of file '/bin/passwd' detected.`  
<img width="1901" height="917" alt="image" src="https://github.com/user-attachments/assets/62f156c0-c54a-42f4-8b6c-8550b125fe7c" />


- **Host-based anomaly detection event**  
  Regla: `id: 510`  
<img width="1894" height="744" alt="image" src="https://github.com/user-attachments/assets/c490afe8-62c4-47af-b473-fd779b8f1f5a" />



## 🛠️ Ataques simulados y alertas generadas

- **Binario del sistema modificado**
  - **Simulación:** detección de integridad en `/bin/passwd`
  - **Alerta generada:**  
    `Trojaned version of file '/bin/passwd' detected`
  - **Severidad:** 7  
  - **Log fuente:** `rootcheck`

---

- **Chequeos de anomalías en host**
  - **Simulación:** ejecución de escaneo de rootkits y binarios alterados
  - **Alerta generada:**  
    `Host-based anomaly detection event (rootcheck)`
  - **Severidad:** 7  
  - **Log fuente:** `rootcheck`
