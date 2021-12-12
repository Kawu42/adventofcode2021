import 'dart:io';

import 'BingoNumber.dart';

class BingoField {
  List<List> _rows = [];
  bool alreadyWon = false;

  List<List> get rows {
    return this._rows;
  }

  void set rows(List<List> value) {
    this._rows = initializeNumbers(value);
    print(this._rows);
  }

  BingoField(List<List> value) {
    this.rows = value;
  }

  List<List> initializeNumbers(List<List> value) {
    List<List> rows = [];
    for (final element in value) {
      List<dynamic> currentElement = element;
      List<BingoNumber> bingoNumbers = [];
      for (final element2 in currentElement) {
        bingoNumbers.add(BingoNumber(element2));
      }
      rows.add(bingoNumbers);
    }
    return rows;
  }

  void markNumber(int value) {
    for (final row in this.rows) {
      for (final bingoNumber in row) {
        if (bingoNumber.number == value && bingoNumber.marked == false) {
          bingoNumber.marked = true;
        }
      }
    }
  }

  bool isWinner() {
    // check rows
    for (final row in this.rows) {
      bool rowWin = true;
      for (final bingoNumber in row) {
        if (!bingoNumber.marked) {
          rowWin = false;
          break;
        }
      }
      if (rowWin) {
        //print('Rowwin!');
        if (alreadyWon) {
          return false;
        } else {
          alreadyWon = true;
          return true;
        }
      }
    }
    // check columns
    for (int i = 0; i < this.rows[0].length; i++) {
      bool columnWin = true;
      for (final row in this.rows) {
        if (!row[i].marked) {
          columnWin = false;
          break;
        }
      }
      if (columnWin) {
        //print('Columnwin!');
        if (alreadyWon) {
          return false;
        } else {
          alreadyWon = true;
          return true;
        }
      }
    }
    // check diagonals
    // check left to right diagonal
    bool diagonalLtRWin = true;
    for (int i = 0; i < this.rows[0].length; i++) {
      if (!this.rows.elementAt(i).elementAt(i).marked) {
        diagonalLtRWin = false;
        break;
      }
    }
    if (diagonalLtRWin) {
      //print('Diagonal L to R win!');
      //return true;
    }
    // check right to left diagonal
    bool diagonalRtLWin = true;
    List<BingoNumber> rtlHistorie = [];
    for (int i = 0; i < this.rows[0].length; i++) {
      if (!this
          .rows
          .elementAt(i)
          .elementAt(this.rows[0].length - i - 1)
          .marked) {
        diagonalRtLWin = false;
        break;
      } else {
        rtlHistorie
            .add(this.rows.elementAt(i).elementAt(this.rows[0].length - i - 1));
      }
    }
    if (diagonalRtLWin) {
      //print('Diagonal R to L win!:\n$rtlHistorie');
      //return true;
    }
    return false;
  }

  int getSumOfUnmarkedNumbers() {
    int sum = 0;
    for (final row in this.rows) {
      for (final bingoNumber in row) {
        if (!bingoNumber.marked) {
          sum += int.parse(bingoNumber.number.toString());
        }
      }
    }
    return sum;
  }
}
