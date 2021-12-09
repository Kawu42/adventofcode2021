import 'dart:io';

class Submarine {
  int _powerConsumption = 0;
  int _gammaRate = 0;
  int _epsilonRate = 0;
  int _binaryLength = 0;
  int _numberOfRows = 0;
  String _gammaRateBinary = '';
  String _epsilonRateBinary = '';
  int _lifeSupportRating = 0;
  int _oxygenGeneratorRating = 0;
  int _CO2ScrubberRating = 0;

  Iterable<String> _inputIterable = [];

  int get binaryLength {
    return this._binaryLength;
  }

  void set binaryLength(int binaryLength) {
    this._binaryLength = binaryLength;
  }

  int get numberOfRows {
    return this._numberOfRows;
  }

  void set numberOfRows(int numberOfRows) {
    this._numberOfRows = numberOfRows;
  }

  String get gammaRateBinary {
    return this._gammaRateBinary;
  }

  void set gammaRateBinary(String gammaRateBinary) {
    this._gammaRateBinary = gammaRateBinary;
  }

  String get epsilonRateBinary {
    return this._epsilonRateBinary;
  }

  void set epsilonRateBinary(String epsilonRateBinary) {
    this._epsilonRateBinary = epsilonRateBinary;
  }

  Iterable<String> get inputIterable {
    return this._inputIterable;
  }

  void set inputIterable(Iterable<String> inputIterable) {
    this._inputIterable = inputIterable;
  }

  int calcPowerConsumption() {
    return this.calcGammaRate() * this.calcEpsilonRate();
  }

  int calcGammaRate() {
    List<List> rows = [];
    List<int> columns = [];

    for (final element in this.inputIterable) {
      columns = [];
      Iterable<String> parseInts = element.split("");
      for (final element in parseInts) {
        columns.add(int.parse(element));
      }
      print(columns);
      rows.add(columns);
    }

    print(rows);
    this.numberOfRows = rows.length;

    for (int i = 0; i < this.binaryLength; i++) {
      int numberOfOnes = 0;
      for (final element in rows) {
        int currentElement = element.elementAt(i);
        if (currentElement == 1) {
          numberOfOnes++;
        }
      }
      if (numberOfOnes > this.numberOfRows / 2) {
        this.gammaRateBinary = this.gammaRateBinary + '1';
        this.epsilonRateBinary = this.epsilonRateBinary + '0';
      } else {
        this.gammaRateBinary = this.gammaRateBinary + '0';
        this.epsilonRateBinary = this.epsilonRateBinary + '1';
      }
    }

    print('Gamma: $gammaRateBinary, Epsilon: $epsilonRateBinary');

    return int.parse(this.gammaRateBinary, radix: 2);
  }

  int calcEpsilonRate() {
    return int.parse(this.epsilonRateBinary, radix: 2);
  }

  int calcLifeSupportRating() {
    return this.calcOxygenGeneratorRating() * this.calcCO2ScrubberRating();
  }

  int calcOxygenGeneratorRating() {
    int mostCommonNumber = -1;
    Iterable<String> iterable = this.inputIterable;
    for (int i = 1; i <= this.binaryLength; i++) {
      mostCommonNumber = findMostCommonValue(iterable, i);
      iterable = removeNumbersWithout(iterable, i, mostCommonNumber);
      if (iterable.length <= 1) {
        print('Iterable is 1 at max: $iterable');
        break;
      } else {
        int currentIterableLength = iterable.length;
        print('Iterable is at $currentIterableLength: $iterable');
      }
    }
    return int.parse(iterable.first, radix: 2);
  }

  int calcCO2ScrubberRating() {
    int mostCommonNumber = -1;
    Iterable<String> iterable = this.inputIterable;
    for (int i = 1; i <= this.binaryLength; i++) {
      mostCommonNumber = findMostCommonValue(iterable, i);
      mostCommonNumber = 1 - mostCommonNumber;
      iterable = removeNumbersWithout(iterable, i, mostCommonNumber);
      if (iterable.length <= 1) {
        print('Iterable is 1 at max: $iterable');
        break;
      }
    }
    return int.parse(iterable.first, radix: 2);
  }

  int findMostCommonValue(Iterable<String> iterable, int position) {
    List<List> rows = [];
    List<int> columns = [];
    int numberOfRows = 0;
    int mostCommonNumber = -1;

    for (final element in iterable) {
      columns = [];
      Iterable<String> parseInts = element.split("");
      for (final element in parseInts) {
        columns.add(int.parse(element));
      }
      print(columns);
      rows.add(columns);
    }

    print(rows);
    numberOfRows = rows.length;

    for (int i = 0; i < position; i++) {
      int numberOfOnes = 0;
      for (final element in rows) {
        int currentElement = element.elementAt(i);
        if (currentElement == 1) {
          numberOfOnes++;
        }
      }
      if (numberOfOnes >= numberOfRows / 2) {
        mostCommonNumber = 1;
      } else {
        mostCommonNumber = 0;
      }
    }
    return mostCommonNumber;
  }

  Iterable<String> removeNumbersWithout(
      Iterable<String> iterable, int position, int commonNumber) {
    List<List> rows = [];
    List<int> columns = [];
    List<List> listList = [];
    List<String> result = [];

    for (final element in iterable) {
      columns = [];
      Iterable<String> parseInts = element.split("");
      for (final element in parseInts) {
        columns.add(int.parse(element));
      }
      print(columns);
      rows.add(columns);
    }

    print('Rows: $rows');

    for (int i = 0; i < position; i++) {
      for (final element in rows) {
        int currentElement = element.elementAt(i);
        if (currentElement == commonNumber) {
          if (i == position - 1) {
            listList.add(element);
          }
        }
      }
    }

    for (final elementi in listList) {
      String elementjString = '';
      for (final elementj in elementi) {
        elementjString += elementj.toString();
      }
      result.add(elementjString);
    }
    print('Result: $result');
    return result;
  }
}
