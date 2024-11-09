#!/bin/bash

read -p "Введите число: " number

if [ $number -gt 0 ]; then
    echo "$number является положительным числом."
elif [ $number -lt 0 ]; then
    echo "$number является отрицательным числом."
else
    echo "Число равно нулю."
fi