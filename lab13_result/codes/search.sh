input_file=""
output_file=""
pattern=""
case_sensitive=false
show_line_numbers=false

while getopts "i:o:p:Cn" opt; do
    case $opt in
        i) input_file="$OPTARG" ;;
        o) output_file="$OPTARG" ;;
        p) pattern="$OPTARG" ;;
        C) case_sensitive=true ;;
        n) show_line_numbers=true ;;
    esac
done

grep_opts=""
if [ "$case_sensitive" = false ]; then
    grep_opts="$grep_opts -i"
fi
if [ "$show_line_numbers" = true ]; then
    grep_opts="$grep_opts -n"
fi
if [ -z "$output_file" ]; then
    grep $grep_opts -- "$pattern" "$input_file"
else
    grep $grep_opts -- "$pattern" "$input_file" > "$output_file"
fi
