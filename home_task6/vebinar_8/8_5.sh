#!/bin/bash

for file in *; do
    new_file=$(echo "$file" | tr '[:upper:]' '[:lower:]')
    if [[ "$file" != "$new_file" ]]; then
        mv "$file" "$new_file"
    fi
done