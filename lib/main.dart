import 'package:flutter/material.dart';
import 'background_widget.dart';
import 'player_class.dart';
import 'player_section.dart';
import 'shortcuts_widget.dart';

import 'darts_logger.dart';

// import 'darts_appbar.dart';

// Temp import while developing
// import 'player_stats_widgets.dart';
// import 'player_scored_widgets.dart';
// import 'player_togo_widgets.dart';
// Background image: https://www.pexels.com/photo/dartboard-hanging-on-wall-at-home-4061482/


void main() {
  initLogger();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PlayerInfo playerA = PlayerInfo(iD: true, name: "player A", startValue: 701);
  PlayerInfo playerB = PlayerInfo(iD: false, name: "player B", startValue: 501);

  void addPlayerADummyData() {
    playerA.addScoredValue(25);
    // playerA.addScoredValue(120);
    // playerA.addScoredValue(17);

    // playerA.scoredList = [1, 2, 3];
    // playerA.toGo = [701, 623, 512];
    playerA.stats = {
      "Start Value": playerA.startValue,
      "Rounds launched": playerA.scoredList.length,
    };
    playerB.addScoredValue(19);
    playerB.addScoredValue(21);
    playerB.addScoredValue(38);
    // playerB.scoredList = [4, 5, 6];
    // playerB.toGo = [701, 610, 560];
    playerB.stats = {
      "Start Value": playerB.startValue,
      "Rounds launched": playerB.scoredList.length,
    };
  }

  @override
  Widget build(BuildContext context) {
    addPlayerADummyData();

    return Scaffold(
      // appBar: DartsAppBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // backgroundColor: Colors.transparent,
        title: const Text('Darts Counter'),
      ),

      body: Stack(
        children: [
          Container(alignment: Alignment.center, child: Background()),

          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: PlayerSection(player: playerA)),
                    Expanded(child: PlayerSection(player: playerB)),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.bottomCenter,
                child: ShortcutButtons(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
