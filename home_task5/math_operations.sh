#!/bin/bash

add() {
    echo "Результат сложения: $(echo "$1 + $2" | bc)"
}

subtract() {
    echo "Результат вычитания: $(echo "$1 - $2" | bc)"
}

multiply() {
    echo "Результат умножения: $(echo "$1 * $2" | bc)"
}

divide() {
    if [ "$(echo "$2 == 0" | bc)" -eq 1 ]; then
        echo "Ошибка: Деление на ноль невозможно."
    else
        echo "Результат деления: $(echo "$1 / $2" | bc)"
    fi
}

is_number() {
    [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]
}

read -p "Введите первое число: " num1
read -p "Введите второе число: " num2

if ! is_number "$num1" || ! is_number "$num2"; then
    echo "Ошибка: Оба значения должны быть числами (целыми или вещественными)."
    exit 1
fi

echo "Выберите операцию:"
echo "1. Сложение (+)"
echo "2. Вычитание (-)"
echo "3. Умножение (*)"
echo "4. Деление (/)"

read -p "Введите номер операции (1-4): " operation

case $operation in
    1)
        add "$num1" "$num2"
        ;;
    2)
        subtract "$num1" "$num2"
        ;;
    3)
        multiply "$num1" "$num2"
        ;;
    4)
        divide "$num1" "$num2"
        ;;
    *)
        echo "Ошибка: Неверный номер операции."
        ;;
esac