#!/bin/bash

# Проверяем, передан ли аргумент с директорией
if [ $# -eq 0 ]; then
    echo "Ошибка: нужно написать <путь_к_директории>"
    exit 1
fi

directory="$1"

# Проверяем, существует ли директория
if [ -d "$directory" ]; then
    cd "$directory"

    # Добавляем префикс ко всем файлам в директории
    for file in *; do
        if [ -f "$file" ]; then
            mv "$file" "backup_$file"
        fi
    done

    echo "Префикс 'backup_' добавлен ко всем файлам в директории '$directory'."
else
    echo "Директория '$directory' не найдена."
fi