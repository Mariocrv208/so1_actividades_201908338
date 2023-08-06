#!/bin/bash

# Valor de GITHUB_USER
GITHUB_USER="Mariocrv208"

# Consultar la URL de GitHub API
API_URL="https://api.github.com/users/$GITHUB_USER"
RESPONSE=$(curl -s "$API_URL")

# Extraer información del JSON de respuesta
USER_ID=$(echo "$RESPONSE" | jq -r '.id')
CREATED_AT=$(echo "$RESPONSE" | jq -r '.created_at')

# Mensaje a imprimir
MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."

# Directorio del script (directorio desde donde se ejecuta el script)
SCRIPT_DIR=$(dirname "$0")

# Crear el directorio de logs con la fecha actual
LOG_DIR="$SCRIPT_DIR/$(date +'%Y%m%d')"
mkdir -p "$LOG_DIR"

# Ruta del archivo de log
LOG_FILE="$LOG_DIR/saludos.log"

# Imprimir el mensaje y guardar en el archivo de log
echo "$MESSAGE" | tee -a "$LOG_FILE"

# Crear un cronjob para que el script se ejecute cada 5 minutos
CRON_JOB="*/5 * * * * $SCRIPT_DIR/$(basename "$0")"
(crontab -l ; echo "$CRON_JOB") | crontab -
