dept=78
page=1
linecount=0
while [ "$linecount" = 0 ]
do
    echo $page
    url="https://www.okkazeo.com/jeux/arrivages?departement=$dept&page=$page"
    echo "Url $url"
    wget -O "$dept.$page.html" "$url"
    grep "Aucune annonce trouvée"  "$dept.$page.html" > "end.html"  
    linecount="$((wc -l "end.html") | cut -d ' ' -f 1)"
    echo "Lignes=$linecount"
    if [ "$linecount" = 0 ]
    then
        echo "end empty"
        grep "Disponible" "$dept.$page.html" > "$dept.$page.dispo.html"
        sed -e 's/<article/\n<article/g' "$dept.$page.dispo.html" > "$dept.$page.jeuun.html"
        sed -e 's/<\/article>/<\/article>\n/g' "$dept.$page.jeuun.html" > "$dept.$page.jeu.html"

        sleep 0.1
        page=$(($page+1))  
    else
        echo "not empty"
    fi
done
