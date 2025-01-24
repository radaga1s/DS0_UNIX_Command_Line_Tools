#!/bin/sh

SRC_FILE="../ex03/hh_positions.csv"
HEADER=$(head -n 1 "$SRC_FILE")
PARTS_FOLDER="parts"

mkdir -p "$PARTS_FOLDER"
tail -n +2 "$SRC_FILE" | awk -F, -v header="$HEADER" -v parts_folder="$PARTS_FOLDER" '{
    split($2, date_time, "T");
    date = date_time[1];
    fname = parts_folder "/" date "\"" ".csv";
    if (!(date in files)) {
        print header > fname;
        files[date] = 1;
    }
    print $0 >> fname;
}'