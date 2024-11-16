#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -ne 1 ]; then
    echo "Ошибка: нужно указать путь к файлу, который нужно отслеживать"
    exit 1
fi

FILE_TO_WATCH=$1

# Получаем первоначальную контрольную сумму файла
LAST_CHECKSUM=$(md5sum "$FILE_TO_WATCH" | awk '{ print $1 }')

# Для постоянного мониторинга
while true; do
    sleep 1
    # Получаем текущую контрольную сумму файла
    CURRENT_CHECKSUM=$(md5sum "$FILE_TO_WATCH" | awk '{ print $1 }')

    # Сравниваем контрольные суммы
    if [ "$LAST_CHECKSUM" != "$CURRENT_CHECKSUM" ]; then
        echo "Файл '$FILE_TO_WATCH' был изменён."
        LAST_CHECKSUM=$CURRENT_CHECKSUM
    fi
done