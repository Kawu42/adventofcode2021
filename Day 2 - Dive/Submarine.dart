class Submarine {
  int _horizontal = 0;
  int _depth = 0;
  int _aim = 0;
  String printStatement = '';

  int get horizontal {
    return this._horizontal;
  }

  void set horizontal(int value) {
    this._horizontal = value;
  }

  int get depth {
    return this._depth;
  }

  void set depth(int value) {
    this._depth = value;
  }

  int get aim {
    return this._aim;
  }

  void set aim(int value) {
    this._aim = value;
  }

  void move(String instruction) {
    List<String> instructionList = instruction.split(" ");
    String instructionText = instructionList[0];
    int instructionValue = int.parse(instructionList[1]);
    //print(instructionList);
    switch (instructionText) {
      case 'forward':
        this.addToHorizontal(instructionValue);
        print(
            ' - $instructionText $instructionValue adds $instructionValue to your horizontal position, a total of $horizontal.');
        break;
      case 'down':
        this.addToDepth(instructionValue);
        print(
            ' - $instructionText $instructionValue adds $instructionValue to your depth, a value of $depth.');
        break;
      case 'up':
        this.substractFromDepth(instructionValue);
        print(
            ' - $instructionText $instructionValue decreases your depth by $instructionValue, resulting in a value of $depth.');
        break;
      default:
    }
  }

  void move2(String instruction) {
    List<String> instructionList = instruction.split(" ");
    String instructionText = instructionList[0];
    int instructionValue = int.parse(instructionList[1]);
    //print(instructionList);
    switch (instructionText) {
      case 'forward':
        this.addToHorizontal(instructionValue);
        this.addToDepth(this.aim * instructionValue);
        int totalDepthAdd = this.aim * instructionValue;
        print(
            ' - $instructionText $instructionValue adds $instructionValue to your horizontal position, a total of $horizontal. Because your aim is $aim, your depth changes by $instructionValue * $aim = $totalDepthAdd.');
        break;
      case 'down':
        this.increaseAim(instructionValue);
        print(
            ' - $instructionText $instructionValue adds $instructionValue to your aim, resulting in a value of $aim.');
        break;
      case 'up':
        this.decreaseAim(instructionValue);
        print(
            ' - $instructionText $instructionValue decreases your aim by $instructionValue, resulting in a value of $aim.');
        break;
      default:
    }
  }

  int multiplyValues() {
    return this.horizontal * this.depth;
  }

  void addToHorizontal(int value) {
    this.horizontal = this.horizontal + value;
  }

  void addToDepth(int value) {
    this.depth = this.depth + value;
  }

  void substractFromDepth(int value) {
    this.depth = this.depth - value;
  }

  void increaseAim(int value) {
    this.aim = this.aim + value;
  }

  void decreaseAim(int value) {
    this.aim = this.aim - value;
  }
}
