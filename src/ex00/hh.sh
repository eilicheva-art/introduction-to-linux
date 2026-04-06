#!/bin/sh

curl -k -H 'User-Agent: api-test-agent' 'https://api.hh.ru/vacancies?text=NAME:data%20scientist&per_page=20&page=0' | jq '.items' > hh.json

