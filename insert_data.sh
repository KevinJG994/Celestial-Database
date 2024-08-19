#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo "Truncating tables..."
$($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY")


echo "Inserting teams..."
cat games.csv | tail -n +2 | cut -d"," -f3,4 | sort | uniq | while IFS="," read -r team1 team2
do
  for team in "$team1" "$team2"
  do

    escaped_team=$(echo "$team" | sed "s/'/''/g")
    
    result=$($PSQL "INSERT INTO teams (name) VALUES ('$escaped_team') ON CONFLICT (name) DO NOTHING")
    if [ $? -ne 0 ]; then
      echo "Error inserting team: $escaped_team"
    fi
  done
done

echo "Inserting games..."
cat games.csv | tail -n +2 | while IFS="," read -r year round winner opponent winner_goals opponent_goals
do

  winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$(echo "$winner" | sed "s/'/''/g")'")
  opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$(echo "$opponent" | sed "s/'/''/g")'")

  if [ -z "$winner_id" ] || [ -z "$opponent_id" ]; then
    echo "Error: Missing team ID for game. Winner: $winner, Opponent: $opponent"
    continue
  fi

  result=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)")
  if [ $? -ne 0 ]; then
    echo "Error inserting game: $year, $round, $winner, $opponent, $winner_goals, $opponent_goals"
  fi
done