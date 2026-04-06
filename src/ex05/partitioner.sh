#!/bin/sh

# partitioner.sh – разбивает CSV на файлы по датам (поле created_at)
# Использование: ./partitioner.sh ../ex03/hh_positions.csv

INPUT_FILE="${1:-../ex03/hh_positions.csv}"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Ошибка: файл $INPUT_FILE не найден" >&2
    exit 1
fi

# Удаляем старые CSV-файлы, если они есть (кроме исходного)
rm -f ????-??-??.csv

awk -F',' '
NR == 1 {
    header = $0
    next
}
{
    # Второе поле created_at, удаляем кавычки
    date_field = $2
    gsub(/^"|"$/, "", date_field)
    date = substr(date_field, 1, 10)
    outfile = date ".csv"
    if (!(outfile in created)) {
        print header > outfile
        created[outfile] = 1
    }
    print $0 >> outfile
}
' "$INPUT_FILE"

echo "Разбиение завершено. Созданы файлы:"
ls -1 ????-??-??.csv 2>/dev/null
