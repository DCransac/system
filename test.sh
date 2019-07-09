
codedepart=78000
ligneprec=78000
ligne=78100
 
  
	if ["$ligneprec" != "$ligne"] && ["ligne" != "$codedepart"]
	then
		  echo $"$ligneprec""!=""$ligne"
	fi
