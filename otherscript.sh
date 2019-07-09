#!/bin/bash
sed 's/text-left">/\n\n/g' oneline.html |grep h4 | sed 's/<\/h4>/\n/g' | sed '/</d'
keyword="$(sed 's/text-left">/\n\n/g' oneline.html |grep h4 | sed 's/<\/h4>/\n/g' | sed '/</d')"
echo $keyword
url="https://www.boardgamegeek.com/geeksearch.php?action=search&objecttype=boardgame&q=$keyword&B1=Go"
wget -O trial.html $url

sed  -n  '/collection_bg.*align/{N;s/\n//;p;}' trial.html > extract.html
nawk '{print $4}' extract.html >notes.html 
sed ':a;{N;s/\n/ /g;ba}' notes.html >t1.html

f=1

note="$(nawk '{print $1}' t1.html)"
echo "La note est $note"
