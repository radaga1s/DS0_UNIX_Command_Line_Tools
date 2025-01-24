#!/bin/sh

SRC_FILE="../ex02/hh_sorted.csv"
PATTERN="junior/middle/senior|junior/middle|middle/senior|junior|middle|senior"

awk -F, -v pattern="$PATTERN" 'BEGIN {OFS=","} {
    if (NR == 1) {
        print $0;
    } else {
        if (match(tolower($3), pattern)) {
            result = substr($3, RSTART, RLENGTH);
        } else {
            result = "-";
        }
        $3 = "\"" result "\"";
        print $0;
    }
}' $SRC_FILE > hh_positions.csv