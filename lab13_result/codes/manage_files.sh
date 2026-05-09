create_files() {
    local n=$1
    echo "Создаю $n файлов (1.tmp ... $n.tmp)..."
    for i in $(seq 1 $n); do
        touch "${i}.tmp"
        echo "  создан ${i}.tmp"
    done
    echo "Готово."
}

delete_files() {
    local n=$1
    echo "Удаляю файлы (1.tmp ... $n.tmp)..."
    for i in $(seq 1 $n); do
        if [ -f "${i}.tmp" ]; then
            rm "${i}.tmp"
            echo "  удалён ${i}.tmp"
        fi
    done
    echo "Готово."
}

N=$1
if [ $# -eq 2 ]; then
    case "$2" in
        -d|--delete)
            delete_files $N
            exit 1
            ;;
    esac
else
    # По умолчанию - создание файлов
    create_files $N
fi
