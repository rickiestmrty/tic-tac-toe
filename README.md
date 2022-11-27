# tic-tac-toe
The Odin Project - Ruby project

Solution:
1. Get player names and Create board
2. Show board
3. Ask current player where they would like to place their mark
4. Check if chosen spot is valid
  4.1 Go back to step 3 if invalid
5. Update board
6. Store chosen spot to player's taken spots
7. Check if a winning combo is found in player's taken spots
  7.1 If none found, proceed to step 8
  7.2 Else, end game and declare current player as winner
8. Check if all spots are taken
  8.1 If there are no spots available, end game
  8.2 Else, proceed to step 9
9. Change current player
10. Go back to step 2
