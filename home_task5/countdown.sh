#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <число>"
    exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Ошибка: Аргумент должен быть положительным целым числом."
    exit 1
fi

count=$1

while [ $count -ge 0 ]; do
    echo $count
    sleep 1
    ((count--))
done

echo "Обратный отсчет завершен!"