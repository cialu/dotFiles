#!/bin/bash
# bubble.sh: Ordinamento a bolle.

# Taken from www.pluto.it

# Ricordo l'algoritmo dell'ordinamento a bolle. In questa particolare versione..

#  Ad ogni passaggio successivo lungo l'array che deve essere ordinato,
#+ vengono confrontati due elementi adiacenti e scambiati se non ordinati.
#  Al termine del primo passaggio, l'elemento "più pesante" è sprofondato 
#+ nell'ultima posizione dell'array. Al termine del secondo passaggio, il 
#+ rimanente elemento "più pesante" si trova al penultimo posto. E così via. 
#+ Questo significa che ogni successivo passaggio deve attraversare una 
#+ porzione minore di array. Noterete, quindi, un aumento della velocità 
#+ di visualizzazione dopo ogni passaggio.  


scambio()
{
  # Scambia due membri dell'array.
  local temp=${Paesi[$1]} #  Variabile per la memorizzazione temporanea
                          #+ dell'elemento che deve essere scambiato.
  Paesi[$1]=${Paesi[$2]}
  Paesi[$2]=$temp
  
  return
}  

declare -a Paesi  #  Dichiara l'array,
                  #+ in questo caso facoltativo perché viene inizializzato
                  #+ successivamente.

#  È consentito suddividere l'inizializzazione di un array su più righe
#+ utilizzando il carattere di escape (\)?
#  Sì.

Paesi=(Olanda Ucraina Zaire Turchia Russia Yemen Siria \
Brasile Argentina Nicaragua Giappone Messico Venezuela Grecia Inghilterra \
Israele Peru Canada Oman Danimarca Galles Francia Kenya \
Xanadu Qatar Liechtenstein Ungheria)

# "Xanadu" è il luogo mitico dove, secondo Coleridge,
#+"Kubla Khan fece un duomo di delizia fabbricare".


clear                  # Pulisce lo schermo prima di iniziare l'elaborazione.

echo "0: ${Paesi[*]}"  # Elenca l'intero array al passaggio 0.

numero_di_elementi=${#Paesi[@]}
let "confronti = $numero_di_elementi - 1"

conto=1 # Numero di passaggi.

while [ "$confronti" -gt 0 ]                # Inizio del ciclo esterno
do

  indice=0  # L'indice viene azzerato all'inizio di ogni passaggio.

  while [ "$indice" -lt "$confronti" ]      # Inizio del ciclo interno
  do
    if [ ${Paesi[$indice]} \> ${Paesi[`expr $indice + 1`]} ]
    #  Se non ordinato...
    #  Ricordo che \> è l'operatore di confronto ASCII
    #+ usato all'interno delle parantesi quadre singole.

    #  if [[ ${Paesi[$indice]} > ${Paesi[`expr $indice + 1`]} ]]
    #+ anche in questa forma.
    then
        scambio $indice `expr $indice + 1`  # Scambio.
    fi
    let "indice += 1"  # Oppure, indice +=1 su Bash ver. 3.1 o successive. 
  done # Fine del ciclo interno
  

# ----------------------------------------------------------------------
#  Paulo Marcel Coelho Aragao suggerisce una pi semplice alternativa
#+ utilizzando i cicli for.
#
# for (( ultimo = $numero_di_elementi - 1 ; ultimo > 0 ; ultimo-- ))
##                     Corretto da C.Y. Hunt         ^   (Grazie!)
# do
#     for (( i = 0 ; i < ultimo ; i++ ))
#     do
#         [[ "${Paesi[$i]}" > "${Paesi[$((i+1))]}" ]] \
#             && scambio $i $((i+1))
#     done
# done
# ----------------------------------------------------------------------


let "confronti -= 1" #  Poiché l'elemento "più pesante" si è depositato in 
                     #+ fondo, è necessario un confronto in meno ad ogni
                     #+ passaggio.

echo
echo "$conto: ${Paesi[@]}"  #  Visualizza la situazione dell'array al termine 
                            #+ di ogni passaggio.
echo
let "conto += 1"            # Incrementa il conteggio dei passaggi.

done                        # Fine del ciclo esterno
                            # Completato.

exit 0
