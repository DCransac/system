codedepart=78000
ligneprec=78000
while read ligne
do 
    echo $"$ligneprec""==""$ligne"
	if ["$ligneprec" != "$ligne"] 
	then
		grep "$ligne" "$depart.html" > "$ligne.html"
		ligneprec="$ligne"
	fi
		
done < codespostaux.html
