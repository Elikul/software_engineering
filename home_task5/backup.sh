#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Использование: $0 <источник> <назначение>"
    exit 1
fi

source_dir="$1"
dest_dir="$2"

if [ ! -d "$source_dir" ]; then
    echo "Ошибка: Директория '$source_dir' не найдена."
    exit 1
fi

mkdir -p "$dest_dir"

for file in "$source_dir"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        current_date=$(date +%Y-%m-%d)
        new_filename="${filename%.*}_$current_date.${filename##*.}"
        cp "$file" "$dest_dir/$new_filename"
        echo "Скопирован: $file -> $dest_dir/$new_filename"
    fi
done

echo "Копирование завершено!"