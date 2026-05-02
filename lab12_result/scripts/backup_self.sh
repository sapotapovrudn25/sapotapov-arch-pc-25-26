BACKUP_DIR="$HOME/backup"
mkdir -p "$BACKUP_DIR"

SCRIPT_PATH=$(realpath "$0")
SCRIPT_NAME=$(basename "$SCRIPT_PATH")
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

ARCHIVE_NAME="backup_${SCRIPT_NAME}_${TIMESTAMP}.tar.bz2"
tar cjf "$BACKUP_DIR/$ARCHIVE_NAME" "$SCRIPT_PATH"

echo "Резервная копия создана: $BACKUP_DIR/$ARCHIVE_NAME"
