#!/bin/bash

LOG_FILE="/var/log/my-app.log"
REDIS_KEY="my_app_log_info"

if [ -e "$LOG_FILE" ]; then
    FILE_SIZE=$(stat -c %s "$LOG_FILE")
    LAST_MODIFIED=$(stat -c %Y "$LOG_FILE")

    if [[ -n "$(redis-cli hget "$REDIS_KEY" size 2>/dev/null)" && -n "$(redis-cli hget "$REDIS_KEY" last_modified 2>/dev/null)" ]]; then
        if [ "$FILE_SIZE" -ne "$(redis-cli hget "$REDIS_KEY" size)" ] || [ "$LAST_MODIFIED" -ne "$(redis-cli hget "$REDIS_KEY" last_modified)" ]; then
            redis-cli hset "$REDIS_KEY" size "$FILE_SIZE"
            redis-cli hset "$REDIS_KEY" last_modified "$LAST_MODIFIED"
            echo "Файл $LOG_FILE змінився. Інформацію записано в Redis."
        else
            echo "Файл $LOG_FILE не змінився."
        fi
    else
        redis-cli hset "$REDIS_KEY" size "$FILE_SIZE"
        redis-cli hset "$REDIS_KEY" last_modified "$LAST_MODIFIED"
        echo "Файл $LOG_FILE змінився. Інформацію записано в Redis."
    fi
else
    echo "Файл $LOG_FILE не існує."
fi
