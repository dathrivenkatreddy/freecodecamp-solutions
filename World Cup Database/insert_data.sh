#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games,teams")

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    #TEAM INSERTION
    #echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    if [[ -z $TEAM_ID ]]
    then
      TEAM_INSERTION_RESULT=$($PSQL "INSERT INTO teams(name) values('$WINNER')")
      echo $TEAM_INSERTION_RESULT
    fi

    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_ID ]]
    then
      TEAM_INSERTION_RESULT=$($PSQL "INSERT INTO teams(name) values('$OPPONENT')")
      echo $TEAM_INSERTION_RESULT
    fi

    #GAME INSERTION
    WINNER_ID=$($PSQL "SELECT team_id from teams where name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id from teams where name='$OPPONENT'")
    GAME_ID=$($PSQL "SELECT game_id from games where year=$YEAR and round='$ROUND' and winner_id=$WINNER_ID and opponent_id=$OPPONENT_ID and winner_goals=$WINNER_GOALS and opponent_goals=$OPPONENT_GOALS")
    
    if [[ -z $GAME_ID ]]
    then
      GAME_INSERTION_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
      echo $GAME_INSETION_RESULT
    fi


    
  fi
done
