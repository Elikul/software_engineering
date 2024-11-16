#!/bin/bash

# Проверяем, был ли передан аргумент
if [ $# -eq 0 ]; then
    echo "Ошибка: нужно написать <имя_файла>"
    exit 1
fi

filename="$1"

# Проверяем, существует ли файл и является ли он обычным файлом
if [ -f "$filename" ]; then
    # Используем команду wc для подсчета строк
    line_count=$(wc -l < "$filename")
    echo "Количество строк в файле '$filename': $line_count"
else
    echo "Файл '$filename' не найден или не является обычным файлом."
fi