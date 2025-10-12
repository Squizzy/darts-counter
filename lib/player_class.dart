class PlayerInfo {
  bool iD = false;
  String name = "";
  int startValue = 0;
  List<int> scored = [];
  List<int> toGo = [];
  Map<String, int> stats = {};

  PlayerInfo({required this.iD, required this.name, required this.startValue}) {
    toGo.add(startValue);
    // initStats();
  }

  void initStats() {
    stats = {"Start Value": startValue, "Rounds launched": scored.length};
  }

  int remainder() {
    return toGo[toGo.length - 1];
  }
}

