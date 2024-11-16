#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -ne 1 ]; then
    echo "Ошибка: нужно указать длину пароля."
    exit 1
fi

# Присваиваем длину пароля переменной
LENGTH=$1

# Проверяем, является ли длина пароля числом
if ! [[ "$LENGTH" =~ ^[0-9]+$ ]]; then
    echo "Ошибка: длина пароля должна быть положительным целым числом."
    exit 1
fi

SYMBOLS="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

PASSWORD=""

for ((i=0; i<LENGTH; i++)); do
    PASSWORD+="${SYMBOLS:RANDOM%${#SYMBOLS}:1}"
done

# Выводим сгенерированный пароль
echo "Сгенерированный пароль: $PASSWORD"