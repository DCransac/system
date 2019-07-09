#!/bin/bash

codepostal="$1"
echo "Code Postal = $codepostal"
departement=$(($codepostal/1000))
echo "Departement = $departement"

page=2
url="https://www.okkazeo.com/jeux/arrivages?departement=$departement&page=$page"
echo "Url = $url"
wget -q -O 78.2.html "$url"
grep "Disponible" 78.2.html > 78.2.dispo.html
sed -e 's/<article/\n<article/g' 78.2.dispo.html > 78.2.jeu.html
sleep 1

