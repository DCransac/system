dept=78
page=1


url="https://www.okkazeo.com/jeux/arrivages?departement=$dept&page=$page"

wget -O "$dept.$page.html" "$url"
grep "Aucune annonce trouvée"  "$dept.$page.html" > "end.html"
linecount="$((wc -l "end.html") | cut -d ' ' -f 1)"
while [ "$linecount" = 0 ]
do
    grep "Disponible" "$dept.$page.html" > "$dept.$page.dispo.html"
    sed -e 's/<article/\n<article/g' "$dept.$page.dispo.html" > "$dept.$page.jeu.html"
    sleep 0.1
    page=$(($page+1))


url="https://www.okkazeo.com/jeux/arrivages?departement=$dept&page=$page"

    wget -O "$dept.$page.html" "$url"
    grep "Aucune annonce trouvée"  "$dept.$page.html" > "end.html"
    linecount="$((wc -l "end.html") | cut -d ' ' -f 1)"
    echo "Lignes=$linecount"

done
