#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")
if [[ -z "$USER_ID" ]] 
then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME');")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")
else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID;")
    BEST_GUESS=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id = $USER_ID;")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
fi
SECRET_NUMBER=$(($RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=1
LOOP=1
echo -e "\nGuess the secret number between 1 and 1000:"
while [[ $LOOP -eq 1 ]]
do
    read GUESS
    if [[ $GUESS =~ ^[0-9]+$ ]]
    then
        if [[ $GUESS -eq $SECRET_NUMBER ]]
        then
            echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
            INSERT_NEW_GAME=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES ($USER_ID, $NUMBER_OF_GUESSES);")
            LOOP=0
        elif [[ $GUESS > $SECRET_NUMBER ]]
        then
            echo -e "\nIt's lower than that, guess again:"
            NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
        else
            echo -e "\nIt's higher than that, guess again:"
            NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
        fi
    else
        echo -e "\nThat is not an integer, guess again:"
    fi
done