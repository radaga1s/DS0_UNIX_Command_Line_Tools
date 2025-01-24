#!/bin/sh

SRC_FILE="../ex01/hh.csv"
(head -n 1 $SRC_FILE && tail -n +2 $SRC_FILE | sort -t, -k2,2 -k1,1) > hh_sorted.csv