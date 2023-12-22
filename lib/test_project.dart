import 'tic_tac_toe.dart';

void main() {
  TicTacToe game =  TicTacToe();
    game.printBoard();
  for (int i = 0; i < 9; i++) {
    game.play();
    game.printBoard();
    if (game.checkWiner()) {  
      return;
    }
  }
  print('Tie');
}