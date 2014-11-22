greppdfs(){
  for i in $1/*.pdf
  do
    echo $i
    pdftotext "$i" - | grep "$2"
  done
}

greppdf(){
  echo $1
  pdftotext "$1" - | grep "$2"
}
