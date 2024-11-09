#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Ошибка: Файл '$1' не найден."
    exit 1
fi

while IFS= read -r line; do
    echo "$line"
done < "$1"