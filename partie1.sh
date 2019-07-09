dept=78
page=1


url="https://www.okkazeo.com/jeux/arrivages?departement=$dept&page=$page"
touch  "depart.html" 
wget -O "$dept.$page.html" "$url"
grep "Aucune annonce trouvée"  "$dept.$page.html" > "end.html"
linecount="$((wc -l "end.html") | cut -d ' ' -f 1)"
while [ "$linecount" = 0 ]
do
	grep "Disponible" "$dept.$page.html" > "$dept.$page.dispo.html"
    sed -e 's/<article/\n<article/g' "$dept.$page.dispo.html" > "$dept.$page.jeu.html"
    cat "depart.html" "$dept.$page.jeu.html" > "temp.html" 
    mv "temp.html" "depart.html"
    sleep 0.1
    page=$(($page+1))
    
    
	url="https://www.okkazeo.com/jeux/arrivages?departement=$dept&page=$page"

    wget -O "$dept.$page.html" "$url"
    grep "Aucune annonce trouvée"  "$dept.$page.html" > "end.html"
    linecount="$((wc -l "end.html") | cut -d ' ' -f 1)"
    echo "Lignes=$linecount"
    
done 
nawk -f date.awk depart.html > depart_date.html

sed -n '/78[0-9][0-9][0-9]/p' depart.html | sed 's/)/\n/g' | sed 's/(/\n/g' | sed -n '/78[0-9][0-9][0-9]/p' > precodespostaux.html
nawk '{if(NF==1){print $0;}}' precodespostaux.html >! codespostaux.html

