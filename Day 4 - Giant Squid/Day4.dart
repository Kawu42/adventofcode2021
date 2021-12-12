import 'dart:convert';

import 'Bingo.dart';
import 'Input.dart';

void main(List<String> args) {
  Input input = Input();
  part1(input.actualInput);
}

part1(String input) {
  Iterable<String> inputIterable = splitInput(input);

  int i = -1;
  int j = 0;
  Bingo bingo = new Bingo();
  List<List> rows = [];
  for (final element in inputIterable) {
    i++;
    print('$i:\t $element');
    if (i == 0) {
      List<int> intList = [];
      List<String> currentStringList = element.split(",");
      for (final StringElement in currentStringList) {
        intList.add(int.parse(StringElement));
      }
      bingo.randomNumbers = intList;
    } else if (element == "") {
      j = 1;
      rows = [];
      continue;
    } else if (j > 0) {
      List<String> stringList = [];
      List<int> currentIntList = [];

      stringList = element.split(" ");
      for (final StringElement2 in stringList) {
        if (StringElement2 != "") {
          currentIntList.add(int.parse(StringElement2));
        }
      }
      rows.add(currentIntList);
      if (j == 5) {
        bingo.addBingoField(rows);
      }
      j++;
    }
  }

  bingo.startGame();
}

Iterable<String> splitInput(String input) {
  LineSplitter lineSplitter = new LineSplitter();
  return lineSplitter.convert(input);
}
