#!/bin/bash

DIR_NAME="test_dir"

mkdir "$DIR_NAME"

cd "$DIR_NAME" || { echo "Не удалось перейти в директорию $DIR_NAME"; exit 1; }

touch file1.txt file2.txt file3.txt

echo "Созданы файлы: file1.txt, file2.txt, file3.txt"

ls -a

rm file1.txt file2.txt file3.txt

echo "Файлы удалены."

ls -a

cd ..

rmdir "$DIR_NAME"

echo "Директория $DIR_NAME удалена."