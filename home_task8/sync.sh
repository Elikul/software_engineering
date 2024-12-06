#!/bin/bash

REMOTE_USER="root"  # Имя пользователя на удаленном сервере
REMOTE_HOST="localhost"  # IP-адрес удаленного сервера
SSH_PORT=2223  # если нестандартный порт ssh
REMOTE_PATH="~/Downloads" # Директория на удаленном сервере

# Выполняем синхронизацию
rsync -avz --exclude=*.tmp --exclude=*.log -e "ssh -p $SSH_PORT" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"