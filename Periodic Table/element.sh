#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only --no-align -c"

#ARG CHECK
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  #query element
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    QUERY_RESULT=$($PSQL "select e.atomic_number, e.name, e.symbol, p.atomic_mass, t.type, p.melting_point_celsius, p.boiling_point_celsius from elements as e inner join properties as p using(atomic_number) inner join types as t using(type_id) where atomic_number='$1' or symbol='$1' or name='$1';")
  else
    QUERY_RESULT=$($PSQL "select e.atomic_number, e.name, e.symbol, p.atomic_mass, t.type, p.melting_point_celsius, p.boiling_point_celsius from elements as e inner join properties as p using(atomic_number) inner join types as t using(type_id) where symbol='$1' or name='$1';")
  fi

  if [[ -z $QUERY_RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    echo $QUERY_RESULT | while IFS='|' read ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS TYPE MP BP
    do
    #echo $QUERY_RESULT
    #echo "$ATOMIC_NUMBER $NAME $SYMBOL $ATOMIC_MASS $TYPE $MP $BP"
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
  fi
fi

