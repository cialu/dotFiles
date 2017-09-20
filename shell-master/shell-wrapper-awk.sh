#!/bin/bash
# pr-ascii.sh: Visualizza una tabella di caratteri ASCII.

# Taken from www.pluto.it

INIZIO=33   # Intervallo dei caratteri ASCII stampabili (decimali).
FINE=125

echo " Decimale  Esa     Carattere"   # Intestazione.
echo " --------  ---     ---------"

for ((i=INIZIO; i<=FINE; i++))
do
  echo $i | awk '{printf("  %3d       %2x         %c\n", $1, $1, $1)}'
# In questo contesto, il builtin Bash printf non funziona:
#     printf "%c" "$i"
done

exit 0


#  Decimale  Esa     Carattere
#  --------  ---     ---------
#    33       21         !
#    34       22         "
#    35       23         #
#    36       24         $
#
#    . . .
#
#   122       7a         z
#   123       7b         {
#   124       7c         |
#   125       7d         }


#  Redirigete l'output dello script in un file
#+ o collegatelo con una pipe a "more":  sh pr-asc.sh | more
