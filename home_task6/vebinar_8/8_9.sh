#!/bin/bash

# 1 команда
echo "Запустилась 1 команда"
ping -c 4 google.com &

# 2 команда
echo "Запустилась 2 команда"
curl -I https://yandex.ru &

# 3 команда
echo "Запустилась 3 команда"
sleep 10 &

# Ожидаем завершения всех фоновых процессов
wait

echo "Все команды завершены"