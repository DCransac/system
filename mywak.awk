BEGIN{FS="Publiées le|<\/span>";}
{
if (NF==3){
mydate=$2;
}
else{
if (NF==2){
print "\n<span class=\"titre-date-publication\">",mydate,"</span>\n", $0;
}
}
}
