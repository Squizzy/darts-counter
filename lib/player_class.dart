// import 'dart:developer';
import 'package:logging/logging.dart';

final Logger log = Logger("player_class");

class PlayerInfo {
  bool iD = false;
  String name = "";
  int startValue = 0;
  List<int> scoredList = [];
  List<int> toGo = [];
  Map<String, int> stats = {};

  PlayerInfo({required this.iD, required this.name, required this.startValue}) {
    toGo.add(startValue);
    // initStats();
  }

  void initStats() {
    stats = {"Start Value": startValue, "Rounds launched": scoredList.length};
  }

  int remainder() {
    return toGo[toGo.length - 1];
  }

  bool isScoredValueValid(int value) {
    // Scored value must be between 0 and 180
    if (value > 180) {
      return false;
    }

    if (value < 0) {
      return false;
    }
    return true;
  }

  bool isScoredValuePermissible(int value) {
    // scored value must not lead to a negative remainder
    if (toGo[toGo.length - 1] - value < 0) {
      return false;
    }
    return true;
  }

  bool addScoredValue(int value) {
    // store the score if the value is ok, then regenerate the ToGo list
    log.info("addScoredValue reached");

    if (!isScoredValueValid(value)) return false;

    if (!isScoredValuePermissible(value)) return false;

    scoredList.add(value);

    recalculateToGo();

    return true;
  }

  void recalculateToGo() {
    log.info("recalculateToGo reached");
    toGo = [startValue];
    for (int round = 0; round < scoredList.length; round++) {
      toGo.add(toGo[round] - scoredList[round]);
    }
  }
}
