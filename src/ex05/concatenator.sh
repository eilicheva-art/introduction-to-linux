#!/bin/sh

# concatenator.sh – объединяет все CSV-файлы по датам в один CSV (stdout)
# Использование: ./concatenator.sh > restored.csv

# Находим файлы дат (YYYY-MM-DD.csv) и сортируем по имени (по дате)
files=$(ls ????-??-??.csv 2>/dev/null | sort)

if [ -z "$files" ]; then
    echo "Ошибка: нет файлов с датами (формата YYYY-MM-DD.csv)" >&2
    exit 1
fi

first=1
for file in $files; do
    if [ $first -eq 1 ]; then
        # Первый файл – выводим полностью (включая заголовок)
        cat "$file"
        first=0
    else
        # Остальные файлы – выводим строки, начиная со второй (без заголовка)
        tail -n +2 "$file"
    fi
done
