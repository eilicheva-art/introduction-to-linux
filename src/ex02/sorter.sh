#!/bin/sh

# Сортировка hh.csv по created_at (поле 2), затем по id (поле 1)
# Заголовок (первая строка) остаётся на месте, остальные строки сортируются

{
  head -n1 ../ex01/hh.csv
  tail -n+2 ../ex01/hh.csv | sort -t',' -k2,2 -k1,1
} > hh_sorted.csv
