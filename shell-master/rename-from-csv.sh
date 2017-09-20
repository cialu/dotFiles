# !/bin/bash
# Simple SHELL script for Linux and UNIX systems 
# Rename files from csv file
# -------------------------------------------------------------------------
# Original version taken from Ubuntu-it Forum
# Link: http://forum.ubuntu-it.org/viewtopic.php?f=8&p=4815620&sid=55a6a7669b4e2c98230c10f5168a2396#p4815620
# -------------------------------------------------------------------------

file_csv='/tmp/test/test.csv'
pdf_orig='/tmp/test/pdf'
pdf_dest='/tmp/test/pdf_renamed'
file_base='basefilename_'
ext='.pdf'
line_minus=1      # minus n lines to count

# check csv file
if [ ! -r "$file_csv" ]
   then 
      echo "Sorry, the file $file_csv is unreadable! Exit"
      exit 10
fi

# check folders
if [ ! -d "$pdf_orig" ]
   then 
      echo "Sorry, origin folder $pdf_orig does not exists! Exit"
      exit 20
fi

if [ ! -d "$pdf_dest" ]
   then 
      echo "Sorry, destination folder $pdf_dest does not exists! Exit"
      exit 30
fi

# count pdf
n_pdf=$(ls -1 "$pdf_orig" | wc -l)
# count not empty lines and minus one
n_record=$(($(grep -c '[^\s]' "$file_csv") - line_minus))
# check if records number is same as pdf number
if [ $n_pdf -ne $n_record ]; then
   echo -e "Attention! ($n_pdf) not checks ($n_record)!\nExit"
   exit 50
fi

names=$(awk -F',' -v line_minus=$line_minus  'NR>line_minus {print $1}' "$file_csv")

# rename copies
i=1
while read name ;do
   echo "Renaming file $i"
   cp "$pdf_orig/${file_base}${i}${ext}" "$pdf_dest/${name}${ext}"
   (( i++ ))
done < <(echo "$nomi")

exit $?
