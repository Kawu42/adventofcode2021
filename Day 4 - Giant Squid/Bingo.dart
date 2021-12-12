import 'BingoField.dart';

class Bingo {
  List<int> _randomNumbers = [];
  List<BingoField> _fields = [];

  List<int> get randomNumbers {
    return this._randomNumbers;
  }

  void set randomNumbers(List<int> value) {
    this._randomNumbers = value;
    print('___Bingo.randomnumbers___');
    print(this._randomNumbers);
  }

  List<BingoField> get fields {
    return this._fields;
  }

  void addBingoField(List<List> value) {
    this._fields.add(new BingoField(value));
  }

  void startGame() {
    for (final randomNumber in this.randomNumbers) {
      int currentNumber = randomNumber;
      for (final field in this.fields) {
        field.markNumber(currentNumber);
        if (field.isWinner()) {
          int sumOfUnmarkedNumbers = field.getSumOfUnmarkedNumbers();
          int sumOfUnmarkedTimesWinning = sumOfUnmarkedNumbers * currentNumber;
          print(
              'Sum of unmarked Numbers:\t$sumOfUnmarkedNumbers\nWinning number:\t$currentNumber\nSum of both:\t$sumOfUnmarkedTimesWinning');
          //return;
        }
      }
    }
  }
}
