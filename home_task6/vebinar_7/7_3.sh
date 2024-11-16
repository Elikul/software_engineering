#!/bin/bash

# Проверяем, был ли передан аргумент
if [ "$#" -ne 1 ]; then
    echo "Ошибка: нужно написать <директорию>"
    exit 1
fi

DIRECTORY=$1

DATE=$(date +%F)

ARCHIVE_NAME="archive_${DATE}.tar.gz"

tar -czvf "$ARCHIVE_NAME" "$DIRECTORY"

echo "Архив '$ARCHIVE_NAME' успешно создан."