
nawk -f date.awk depart.html > depart_da.html

sed '/titre-date/{N;s/\n//g}' depart_da.html > depart_date.html




sed -n '/78[0-9][0-9][0-9]/p' depart.html | sed 's/)/\n/g' | sed 's/(/\n/g' | sed -n '/78[0-9][0-9][0-9]/p' > precodespostaux.html
nawk '{if(NF==1){print $0;}}' precodespostaux.html | sort | nawk 'BEGIN{cnt=0;code=""}{if (code!=$0){print $0;code=$0}}' > codespostaux.html

