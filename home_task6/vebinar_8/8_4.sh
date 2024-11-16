#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -ne 1 ]; then
    echo "Ошибка: нужно указать сервер"
    exit 1
fi

SERVER=$1

ping -c 1 $SERVER &> /dev/null && echo "$SERVER is UP" || echo "$SERVER is DOWN"