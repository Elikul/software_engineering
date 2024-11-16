#!/bin/bash

read -p "Введите путь к файлу: " file_path

if [ -e "$file_path" ]; then
    echo "Файл найден!"
else
    echo "Файл не найден."
fi