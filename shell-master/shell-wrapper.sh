#!/bin/bash

# Taken from www.pluto.it

# Questo è un semplice script che rimuove le righe vuote da un file.
# Nessuna verifica d'argomento.
#
# Sarebbe meglio aggiungere qualcosa come:

# E_NOARG=65
# if [ -z "$1" ]
# then
#  echo "Utilizzo: `basename $0` nome-file"
#  exit $E_NOARG
# fi


# È uguale a
#    sed -e '/^$/d' nomefile
# invocato da riga di comando.

sed -e /^$/d "$1"
#  '-e' significa che segue un comando di "editing" (in questo caso opzionale).
#  '^' indica l'inizio della riga, '$' la fine.
#  Verifica le righe che non contengono nulla tra il loro inizio e la fine,
#+ vale a dire, le righe vuote.
#  'd' è il comando di cancellazione.

#  L'uso del quoting per l'argomento consente di
#+ passare nomi di file contenenti spazi e caratteri speciali.

#  Va notato che lo script, in realtà, non modifica il file di riferimento.
#  Se avete questa necessità, effettuate la redirezione dell'output.

exit 0
