#!/bin/sh

OUTPUT_FILE="result.csv"
PARTS_FOLDER="parts"
FIRST_FILE=1

> "$OUTPUT_FILE"

for file in "$PARTS_FOLDER"/*.csv; do
    if ((FIRST_FILE)); then
        cat "$file" >> "$OUTPUT_FILE"
        FIRST_FILE=0
    else
        tail -n +2 "$file" >> "$OUTPUT_FILE"
    fi
done