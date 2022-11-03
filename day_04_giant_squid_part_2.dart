//      dart day_04_giant_squid_part_2.dart

import 'dart:io';

Future<void> main() async {
  final File file = File('inputs/day_04.txt');
  final String contents = await file.readAsString();
  List<String> inputlist = contents.split(',');
  int c1 = 0;
  int c2 = 0;
  int c3 = 0;
  int winnerboard = 0;
  int winnernum = 0;

// read txt and put into lists
  List<String> boardsnumbers =
      inputlist[inputlist.length - 1].split(RegExp(r'\s+'));
  dynamic remover = inputlist.removeAt(inputlist.length - 1);
  inputlist.add(boardsnumbers[0]);
  remover = boardsnumbers.removeAt(0);
  List<List<List<int>>> boards = List<List<List<int>>>.generate(
      boardsnumbers.length ~/ 25,
      (int h) => List<List<int>>.generate(
          5, (int i) => List<int>.generate(5, (int j) => 0)));
  for (int h = 0; h < boardsnumbers.length ~/ 25; h++) {
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        boards[h][i][j] = int.parse(boardsnumbers[(h * 25) + (i * 5) + j]);
      }
    }
  }

  //play the game
  outerLoop:
  for (int k = inputlist.length - 1; k >= 0; k--) {
    for (int h = 0; h < boardsnumbers.length ~/ 25; h++) {
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
          for (int l = 0; l <= k; l++) {
            if (boards[h][i][j] == int.parse(inputlist[l])) {
              c1++;
            }
            if (boards[h][j][i] == int.parse(inputlist[l])) {
              c2++;
            }
          }
        }
        if (c1 < 5) {
          c3++;
        }
        if (c2 < 5) {
          c3++;
        }
        c1 = 0;
        c2 = 0;
      }
      if (c3 == 10) {
        winnernum = k + 1;
        winnerboard = h;
        break outerLoop;
      } else {
        c3 = 0;
      }
    }
  }

  // show wanted board
  // for (int i = 0; i < 5; i++) {
  //   print(boards[winnerboard][i]);
  // }

  // print input numbers until last board wins
  // for (int l = 0; l <= winnernum; l++) {
  //   print(inputlist[l]);
  // }

  // print callout index
  // print(winnernum);

  //sum not highlited numbers
  c1 = 0;
  c2 = 0;
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      for (int l = 0; l <= winnernum; l++) {
        if (boards[winnerboard][i][j] == int.parse(inputlist[l])) {
          c1++;
        }
      }
      if (c1 == 0) {
        c2 += boards[winnerboard][i][j];
      } else {
        c1 = 0;
      }
    }
  }

  // show sum of not highlited and callout number
  // print('c2 $c2 winnum ${inputlist[winnernum]}');

  print(c2 * int.parse(inputlist[winnernum]));
}