#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
echo -e "\n~~Welcome~~\n"

GUESS_GAME(){
  #echo "($2)--"
  if [[ -z $4 ]]
  then
    echo -e "\nGuess the number: "
  else
    echo -e "\n$4"
  fi
  read NUMBER_GUESS
  if [[ $NUMBER_GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $NUMBER_GUESS == $2 ]]
    then
      echo "You guessed it in $3 tries. The secret number was $2. Nice job!";
    else
      NUMBER_OF_GUESSES=$(($3 + 1))
      if [[ $NUMBER_GUESS < $2 ]]
      then
        GUESS_GAME $1 $2 $NUMBER_OF_GUESSES "It's higher than that, guess again"
      else
        GUESS_GAME $1 $2 $NUMBER_OF_GUESSES "It's lower than that, guess again:"
      fi
    fi
  else
    GUESS_GAME $1 $2 $3 "That is not an integer, guess again:"
  fi
}

echo "Enter your username:" 
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';" | sed -r 's/^ *| *$//g')
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME');")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';" | sed -r 's/^ *| *$//g')
else
  GAMES_PLAYED=$($PSQL "SELECT count(game_id) FROM games WHERE user_id=$USER_ID;" | sed -r 's/^ *| *$//g')
  BEST_GAME=$($PSQL "SELECT count(game_id) FROM games WHERE user_id=$USER_ID AND correct=true;" | sed -r 's/^ *| *$//g')
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
fi
SECRET_NUMBER=$(($RANDOM % 1000 + 1))
GUESS_GAME $USER_ID $SECRET_NUMBER 1
