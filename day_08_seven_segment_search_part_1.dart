// dart day_08_seven_segment_search_part_1.dart

import 'dart:io';

// read txt
Future<void> main() async {
  final File file = File('inputs/day_08.txt');
  final String contents = await file.readAsString();
  List<String> inputList = contents.split(RegExp(' |\n'));

  // build array
  List<List<String>> input = List<List<String>>.generate(inputList.length ~/ 15,
      (int i) => List<String>.generate(14, (int j) => ''));
  int k = 0;
  for (int j = 0; j < inputList.length ~/ 15; j++) {
    for (int i = 0; i < 14; i++) {
      if (inputList[k] != '|') {
        input[j][i] = inputList[k];
        k++;
      } else {
        k++;
        input[j][i] = inputList[k];
        k++;
      }
    }
  }

  //trim
  for (int j = 0; j < inputList.length ~/ 15; j++) {
    input[j][13] = input[j][13].trim();
  }

  // count
  int c = 0;
  for (int j = 0; j < inputList.length ~/ 15; j++) {
    for (int i = 10; i < 14; i++) {
      if (input[j][i].length == 2 ||
          input[j][i].length == 3 ||
          input[j][i].length == 4 ||
          input[j][i].length == 7) {
        c++;
      }
    }
  }

  print(c);
}
