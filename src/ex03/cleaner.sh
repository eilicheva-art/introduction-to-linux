#!/bin/sh

# Обработка CSV: извлечение уровней Junior/Middle/Senior из названия вакансии
awk -F ',' '
BEGIN { OFS = "," }
NR == 1 {
    # Заголовок выводим без изменений
    print
    next
}
{
    # Извлекаем поле name (третье поле) и удаляем обрамляющие кавычки
    name = $3
    gsub(/^"|"$/, "", name)

    # Ищем уровни в любом порядке
    levels = ""
    if (index(name, "Junior")) levels = levels (levels == "" ? "" : "/") "Junior"
    if (index(name, "Middle")) levels = levels (levels == "" ? "" : "/") "Middle"
    if (index(name, "Senior")) levels = levels (levels == "" ? "" : "/") "Senior"
    if (levels == "") levels = "-"

    # Заменяем поле name на новый уровень в кавычках
    $3 = "\"" levels "\""

    # Выводим обработанную строку
    print
}
' ../ex02/hh_sorted.csv > hh_positions.csv
