#!/bin/bash

REMOTE_USER="root"  # Имя пользователя на удаленном сервере
REMOTE_HOST="localhost"  # IP-адрес удаленного сервера
SSH_PORT=2223  # если нестандартный порт ssh
THRESHOLD=10 # Порог использования дискового пространства в процентах
EMAIL="linotska@inbox.ru" # Email для отправки уведомлений

# Подключаемся к удаленному серверу и проверяем использование дискового пространства
USAGE=$(ssh -p "$SSH_PORT" "$REMOTE_USER@$REMOTE_HOST" "df / | grep / | awk '{ print \$5 }' | sed 's/%//'")

# Проверяем, превышает ли использование заданный порог
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    # Отправляем уведомление по электронной почте
    echo "Внимание: Использование дискового пространства на сервере $REMOTE_HOST превышает $THRESHOLD%. Текущий уровень: $USAGE%." | mail -s "Уведомление о дисковом пространстве" $EMAIL
fi