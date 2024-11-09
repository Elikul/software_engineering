#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Использование: $0 <имя_файла> <старое_слово> <новое_слово>"
    exit 1
fi

file="$1"
old_word="$2"
new_word="$3"

if [ ! -f "$file" ]; then
    echo "Ошибка: Файл '$file' не найден."
    exit 1
fi

sed -i "s/$old_word/$new_word/g" "$file"

echo "Все вхождения '$old_word' были заменены на '$new_word' в файле '$file'."