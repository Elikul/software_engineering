#!/bin/bash

REMOTE_HOST_ALIAS="myvboxuser"  # Алиас удалённого сервера
REMOTE_DIR="~/Downloads"  # Директория для архивирования на удаленном сервере
LOCAL_ARCHIVE="downloads.tar.gz"  # Имя архива на локальной машине

# Подключение к удаленному серверу и архивирование директории
ssh ${REMOTE_HOST_ALIAS} "tar -czf ${LOCAL_ARCHIVE} -C $(dirname ${REMOTE_DIR}) $(basename ${REMOTE_DIR})"

# Скачивание созданного архива на локальную машину
scp ${REMOTE_HOST_ALIAS}:${LOCAL_ARCHIVE} .

# Разархивирование архива на локальной машине
tar -xzf ${LOCAL_ARCHIVE}