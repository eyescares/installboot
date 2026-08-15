#!/data/data/com.termux/files/usr/bin/bash
# Автозапуск reconnect.py при загрузке телефона (Termux:Boot)

LOG_DIR="$HOME/.reconnect"
LOG_FILE="$LOG_DIR/boot.log"

mkdir -p "$LOG_DIR"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

termux-wake-lock
log "===== BOOT START ====="
log "Запуск reconnect.py"

python3 "$HOME/.reconnect/reconnect.py" >> "$LOG_FILE" 2>&1
EXIT_CODE=$?

log "reconnect.py завершился с кодом: $EXIT_CODE"
log "===== BOOT END ====="
