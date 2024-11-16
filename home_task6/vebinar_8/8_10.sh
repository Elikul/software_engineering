#!/bin/bash

while true; do
    echo "Введите команду:"
    read command

    case "$command" in
        "Дата")
            date
            ;;
        "Выход")
            echo "Выход из бота"
            break
            ;;
        *)
            echo "$command"
            ;;
    esac
done