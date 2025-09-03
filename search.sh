#!/bin/bash

DIRETORIO="$(pwd)"
TEMP_HASHES=$(mktemp)
COUNT=0

echo "🔍 A procurar ficheiros duplicados em: $DIRETORIO"
echo ""

find . -type f | while read -r FICHEIRO; do
    ((COUNT++))
    echo -ne "[$COUNT] A processar: $FICHEIRO\r"
    sha1sum "$FICHEIRO" >> "$TEMP_HASHES"
done

echo -e "\n\n📦 Agrupar ficheiros com o mesmo hash...\n"

awk '
{
    hash=$1
    $1=""
    gsub(/^ +/, "", $0)
    map[hash]=map[hash] "\n" $0
}
END {
    for (h in map) {
        split(map[h], files, "\n")
        if (length(files) > 2) {
            print h ":" map[h]
        }
    }
}
' "$TEMP_HASHES" | while IFS=: read -r hash files; do
    echo "🔁 Ficheiros duplicados (hash: $hash):"
    echo "$files" | tail -n +2 | cat -n
    echo ""

    # Mantém o primeiro ficheiro, pergunta sobre os restantes
    i=0
    echo "$files" | tail -n +2 | while read -r file; do
        ((i++))
        if [[ $i -eq 1 ]]; then
            echo "✅ A manter: $file"
        else
            echo -n "❓ Apagar este ficheiro duplicado? [$file] (s/n): "
            read -r resposta
            if [[ "$resposta" == "s" || "$resposta" == "S" ]]; then
                rm -v "$file"
            else
                echo "❎ Não apagado."
            fi
        fi
    done
    echo ""
done

rm "$TEMP_HASHES"
