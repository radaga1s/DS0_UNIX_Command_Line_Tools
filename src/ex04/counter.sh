#!/bin/sh

SRC_FILE="../ex03/hh_positions.csv"
PATTERN="junior/middle/senior|junior/middle|middle/senior|junior|middle|senior|-"
HEADER='"name","count"'

{
    echo "$HEADER"
    awk -F, -v pattern="$PATTERN" 'BEGIN {OFS=","} {
        if (NR > 1) {
            if (match(tolower($3), pattern)) {
                category = tolower(substr($3, RSTART, RLENGTH));
                counts[category]++;
            }
        }
    }
    END {
        for (category in counts) {
            first_char = toupper(substr(category, 1, 1));
            rest = substr(category, 2);
            formatted_category = "\"" first_char rest "\"";
            print formatted_category, counts[category];
        }
    }' $SRC_FILE | sort -t, -k2,2nr 
} > "hh_uniq_positions.csv" 