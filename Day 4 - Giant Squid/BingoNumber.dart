class BingoNumber {
  int _number = 0;
  bool _marked = false;

  int get number {
    return this._number;
  }

  void set number(int value) {
    this._number = value;
  }

  bool get marked {
    return this._marked;
  }

  void set marked(bool value) {
    this._marked = value;
  }

  BingoNumber(int value) {
    this.number = value;
  }

  @override
  String toString() {
    return '[$_number, $_marked]';
  }
}
