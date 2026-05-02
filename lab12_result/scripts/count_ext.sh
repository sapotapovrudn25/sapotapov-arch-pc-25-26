if [ $# -ne 2 ]; then
    echo "Использование: $0 <расширение> <каталог>"
    echo "Пример: $0 .txt /home/user/docs"
    exit 1
fi

EXT="$1"
DIR="$2"

if [[ "$EXT" != .* ]]; then
    EXT=".$EXT"
fi

if [ ! -d "$DIR" ]; then
    echo "Ошибка: каталог '$DIR' не существует" >&2
    exit 1
fi

COUNT=$(find "$DIR" -maxdepth 1 -type f -name "*$EXT" | wc -l)

echo "Количество файлов с расширением $EXT в каталоге $DIR: $COUNT"
