import 'package:flutter/material.dart';
import 'background_widget.dart';
import 'player_class.dart';
import 'player_section.dart';
import 'shortcuts_widget.dart';

import 'package:logging/logging.dart';
// import 'darts_appbar.dart';

// Temp import while developing
// import 'player_stats_widgets.dart';
// import 'player_scored_widgets.dart';
// import 'player_togo_widgets.dart';
// Background image: https://www.pexels.com/photo/dartboard-hanging-on-wall-at-home-4061482/

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

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


  // // void recordAScore(int value) {
  // //   // TODO: This should be moved to PlayerInfo
  // //   setState(() {
  // //     int remainder = playerA.remainder() - value;

  // //     if (remainder > 0) {
  // //       playerA.scoredList.add(value);
  // //       playerA.toGo.add(remainder);
  // //     } else {
  // //       // Do something
  // //     }
  // //   });
  // // }

  // // void recordBScore(int value) {
  // //   // TODO: This should be moved to PlayerInfo
  // //   setState(() {
  // //     int remainder = playerB.remainder() - value;

  // //     if (remainder > 0) {
  // //       playerB.scoredList.add(value);
  // //       playerB.toGo.add(remainder);
  // //     } else {
  // //       // Do something
  // //     }
  // //   });
  // }

  // void recalculate(PlayerInfo player) {
  //     setState((){
  //       player.recalculateToGo();
  //   });
  // }

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
      // )

      // body: Container(),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: SizedBox(
      //     width: double.infinity,

      //     child: Column(
      //       mainAxisSize: MainAxisSize.max,

      //       // crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         Row(
      //           children: [
      //             Expanded(child: PlayerSection(player: playerA)),
      //             SizedBox(width: 40),
      //             Expanded(child: PlayerSection(player: playerB)),
      //           ],
      //         ),

      //         Row(children: [Expanded(child: FnKeys())]),
      //       ],
      //     ),
      //   ),
      // ),
      // // Players names area
      // Row(
      //   children: [
      //     Expanded(child: PlayerName(name: 'Player A', isPlayerA: true)),
      //     SizedBox(width: 40),
      //     Expanded(child: PlayerName(name: 'Player B', isPlayerA: false)),
      //   ],
      // ),

      // Row(
      //   children: [
      //     Expanded(flex: 3, child: PlayerStatsTitle(name: "Stats")),
      //     Expanded(child: ScoredTitle(name: "Score")),
      //     Expanded(child: ToGoTitle(name: "To Go")),
      //     SizedBox(width: 40),
      //     Expanded(child: ScoredTitle(name: "Score")),
      //     Expanded(child: ToGoTitle(name: "To Go")),
      //     Expanded(flex: 3, child: PlayerStatsTitle(name: "Stats")),
      //   ],
      // ),
      // // Players Statistics, scored values, score to go
      // Expanded(
      //   child: Row(
      //     children: [
      //       Expanded(flex: 3, child: PlayerStats(stats: [3, 9, 12])),
      //       // Expanded(child: Scored(currentScoreUpdate: [5, 4, 3])),
      //       Expanded(child: Scored(currentScoreUpdate: playerAScored)),
      //       Expanded(
      //         child: ToGoCounter(
      //           // currentScoreUpdate: [5, 4, 3],
      //           // toGoUpdate: [15, 11, 8, 5],
      //           // startScore: 501,
      //           toGoUpdate: playerARemainder,
      //           startScore: playerAStart,
      //         ),
      //       ),
      //       SizedBox(width: 40),
      //       Expanded(
      //         child: Scored(
      //           currentScoreUpdate: playerBScored,
      //           // Expanded(child: Scored(currentScoreUpdate: [5, 4, 3],
      //           // toGo: [15, 11, 8],
      //           // startScore: 501,
      //         ),
      //       ),
      //       // Expanded(child: ToGoCounter(toGoUpdate: [15, 11, 8, 7],startScore: 501,),),
      //       Expanded(
      //         child: ToGoCounter(
      //           toGoUpdate: playerBRemainder,
      //           startScore: playerBStart,
      //         ),
      //       ),
      //       Expanded(flex: 3, child: PlayerStats(stats: [20, 3, 7])),
      //     ],
      //   ),
      // ),

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Expanded(
      //       child: PlayerRemainder(
      //         remainder: playerARemainder[playerARemainder.length - 1],
      //       ),
      //     ),
      //     // Expanded(child: PlayerRemainder(remainder: 27)),
      //     SizedBox(width: 40),
      //     Expanded(
      //       child: PlayerRemainder(
      //         remainder: playerBRemainder[playerBRemainder.length - 1],
      //       ),
      //     ),
      //     // Expanded(child: PlayerRemainder(remainder: 200)),
      //   ],
      // ),

      // Row(children: [Expanded(child: FnKeys())]),

      // // const Text('You have pushed the button this many times:'),
      // // Text('$_counter', style: Theme.of(context).textTheme.headlineMedium,),

      // // Row(
      //   children: [
      //     Expanded(child: TextField(controller: _textField1, decoration: InputDecoration(labelText: 'Text Area 1'),),),
      //     SizedBox(width: 8),
      //     Expanded(child: TextField(controller: _textField2, decoration: InputDecoration(labelText: 'Text Area 2'),),),
      //   ],
      // ),
      // Row(
      //   children:  [
      //     SizedBox(height: 8),
      //     Expanded(child: TextButton(onPressed: _decrementCounter, child: Text('Decrement'),)),
      //     Expanded(child: TextButton(onPressed: _incrementCounter, child: Text('Increment'),)),
      // ],
      //   ),
      // ],
      // ),
      // ),
      // floatingActionButton: FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: const Icon(Icons.add),),
    );
  }
}
