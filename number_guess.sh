#!/bin/bash

# Configuración de la conexión a la base de datos
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Solicitar nombre de usuario
echo "Enter your username:"
read USERNAME

# Verificar si se ingresó un nombre de usuario
if [ -z "$USERNAME" ]; then
  echo "Username cannot be empty."
  exit 1
fi

# Validar longitud del nombre de usuario
if [ ${#USERNAME} -gt 22 ]; then
  echo "Username must be 22 characters or less."
  exit 1
fi

# Verificar si el usuario ya existe
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME';")

if [ -z "$USER_INFO" ]; then
  # Usuario no encontrado
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insertar nuevo usuario
  INSERT_RESULT=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$USERNAME', 0, NULL);")
else
  # Usuario encontrado
  GAMES_PLAYED=$(echo "$USER_INFO" | cut -d'|' -f1)
  BEST_GAME=$(echo "$USER_INFO" | cut -d'|' -f2)
  BEST_GAME=${BEST_GAME:-N/A}
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generar número secreto
SECRET_NUMBER=$((RANDOM % 1000 + 1))

# Inicializar el conteo de intentos
TRIES=0

# Solicitar adivinanza
echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS

  # Validar entrada
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  TRIES=$((TRIES + 1))

  if [ $GUESS -lt $SECRET_NUMBER ]; then
    echo "It's higher than that, guess again:"
  elif [ $GUESS -gt $SECRET_NUMBER ]; then
    echo "It's lower than that, guess again:"
  else
    # Número adivinado correctamente
    echo "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Actualizar datos del usuario en la base de datos
    if [ -z "$USER_INFO" ]; then
      # Primer juego
      UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = $TRIES WHERE username = '$USERNAME';")
    else
      # Usuario existente
      if [ -z "$BEST_GAME" ] || [ $TRIES -lt $BEST_GAME ]; then
        UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = $TRIES WHERE username = '$USERNAME';")
      else
        UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME';")
      fi
    fi

    exit
  fi
done