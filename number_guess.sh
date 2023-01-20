#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
echo -e "\n~~Welcome~~\n"
echo "Enter your username:" 
read USERNAME