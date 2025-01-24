#!/bin/sh

curl -s -X GET "https://api.hh.ru/vacancies?text=data+scientist&per_page=20" \
-H "User-Agent: S21_Script/1.0 (nels.margarito@megasend.org)" | jq '.' > hh.json
