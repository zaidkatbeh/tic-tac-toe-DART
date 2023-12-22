export 'tic_tac_toe.dart' show TicTacToe;
import 'dart:io';

class TicTacToe {
  // identify if its play 1 turn (true) if player 2 (false)
  bool turn = true;
  final List<String> board = List.filled(9, '');
// funtion to place the x or o on the board
  void play() {
    // getting the input from the user
    print(
        "player ${turn ? 1 : 2} please enter the number of the square you want to place your ${turn ? 'X' : 'O'}");
    String? input = stdin.readLineSync();
    if (input == null) {
      inValidInput('please enter a value');
    } else {
      int userPick;
      try {
        userPick = int.parse(input) - 1;
        if (userPick < 0 || userPick > 8) {
          inValidInput('pick a square between 1 and 9');
        } else if (board[userPick].isNotEmpty) {
          inValidInput('this square is already picked');
        } else {
          board[userPick] = turn ? 'X' : 'O';
          turn = !turn;
        }
      } catch (e) {
        inValidInput('please enter a valid number');
      }
    }
  }

  void inValidInput(String error) {
    print('---------------');
    print(error);
    printBoard();
    play();
  }

  bool checkWiner() {
    // previus play is the player from last round meaning !(currnet player)
    final previusplayer = turn ? 'O' : 'X';
    print(previusplayer);
    // check for vertical win
    for (int i = 0; i < 3; i++) {
      if (board[i] == previusplayer &&
          board[i + 3] == previusplayer &&
          board[i + 6] == previusplayer) {
        print('player${turn ? 2 : 1} won!');
        return true;
      }
    }

    // check for horizantal win
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == previusplayer &&
          board[i + 1] == previusplayer &&
          board[i + 2] == previusplayer) {
        print('player${turn ? 2 : 1} won!');
        return true;
      }
    }

    // check for other wins ex : 1 5 9
    if ((board[0] == previusplayer &&
            board[4] == previusplayer &&
            board[8] == previusplayer) ||
        (board[2] == previusplayer &&
            board[4] == previusplayer &&
            board[6] == previusplayer)) {
      print('player${turn ? 2 : 1} won!');
      return true;
    }
    return false;
  }

// print to play board
  void printBoard() {
    print(
        "  ${getSquareValue(0)} |  ${getSquareValue(1)} |  ${getSquareValue(2)} ");
    print("---+---+------");
    print(
        "  ${getSquareValue(3)} |  ${getSquareValue(4)} |  ${getSquareValue(5)} ");
    print("---+---+------");
    print(
        "  ${getSquareValue(6)} |  ${getSquareValue(7)} |  ${getSquareValue(8)} ");
  }

// checks if the square is already picked if so return its value if not return its number
  String getSquareValue(int squareNumber) {
    if (board[squareNumber].isEmpty) {
      return (squareNumber + 1).toString();
    } else {
      return board[squareNumber];
    }
  }
}
