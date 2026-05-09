DIR="$1"
ARCHIVE="$2"

if [ ! -d "$DIR" ]; then
    echo "Ошибка: директория '$DIR' не существует"
    exit 1
fi

cd "$DIR" || exit 1
find . -maxdepth 1 -type f -mtime -7 -print0 | tar -cvf "$ARCHIVE" --null -T -

if [ $? -eq 0 ]; then
    echo "Архив '$ARCHIVE' создан (только файлы, изменённые за последнюю неделю)"
else
    echo "Ошибка: либо нет подходящих файлов, либо проблемы с созданием архива"
    exit 1
fi
