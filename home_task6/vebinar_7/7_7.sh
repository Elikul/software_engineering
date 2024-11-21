#!/bin/bash

# Функция для сложения двух чисел
add() {
    # Проверяем, переданы ли два аргумента
    if [ $# -ne 2 ]; then
        echo "Ошибка: нужно написать два аргумента."
        return 1
    fi

    # Вычисляем сумму и выводим результат
    result=$(( $1 + $2 ))
    echo "Сумма $1 и $2 равна $result"
}

# Вызов функции с двумя аргументами
add "$1" "$2"