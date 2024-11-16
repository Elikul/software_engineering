#!/bin/bash

API_TOKEN="7370688388:AAGwWFYfK65BosUZykwvAN2z4qeHt1-O0-w"
CHAT_ID="899140973"

MESSAGE="тестовое сообщение"

curl -s -X POST "https://api.telegram.org/bot$API_TOKEN/sendMessage" \
     -d "chat_id=$CHAT_ID" \
     -d "text=$MESSAGE"