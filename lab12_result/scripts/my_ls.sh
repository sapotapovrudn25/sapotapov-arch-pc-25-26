DIR="${1:-.}"

if [ ! -d "$DIR" ]; then
    echo "Ошибка: '$DIR' не является каталогом" >&2
    exit 1
fi

echo "Содержимое каталога $DIR:"
echo "Права доступа    Имя"
echo "-----------------------"

for file in "$DIR"/*; do
    if [ -e "$file" ]; then
        perms=$(stat -c "%A" "$file" 2>/dev/null)
        name=$(basename "$file")
        echo "$perms    $name"
    fi
done
