#!/bin/sh

# Подсчёт уникальных значений в столбце name (третье поле) из hh_positions.csv
# Результат: CSV с заголовками "name","count" и строками, отсортированными по убыванию count

# Добавляем заголовок
echo '"name","count"' > hh_uniq_positions.csv

# Извлекаем поле name (пропуская заголовок), удаляем кавычки, считаем частоты,
# сортируем по убыванию, форматируем как CSV и добавляем в файл
tail -n +2 ../ex03/hh_positions.csv | \
  awk -F',' '{print $3}' | \
  sed 's/"//g' | \
  sort | \
  uniq -c | \
  sort -rn | \
  awk '{print "\""$2"\",\""$1"\""}' >> hh_uniq_positions.csv
