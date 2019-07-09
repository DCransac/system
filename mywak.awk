BEGIN{FS="Publiées le|<\/span>";}
{
if (NF==3){
mydate=$2;
}
else{
if (NF==2){
print NF,mydate, $0
}
}
}
