echo "Количество аргументов: $#"
echo "Список аргументов:"
for arg in "$@"; do
    echo "$arg"
done
