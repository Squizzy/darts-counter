import 'package:flutter/material.dart';
import 'background_widget.dart';
import 'player_class.dart';
import 'player_section.dart';
// import 'shortcuts_widget.dart';
import 'player_stats_widgets.dart';
import 'player_scored_widgets.dart';
import 'player_togo_widgets.dart';
// Background image: https://www.pexels.com/photo/dartboard-hanging-on-wall-at-home-4061482/

// import 'player_class.dart';
// import 'player_scored_widgets.dart';
// import 'player_togo_widgets.dart';
// import 'player_stats_widgets.dart';

void main() {
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

// class PlayerName extends StatelessWidget {
//   const PlayerName({super.key, required this.name, required this.isPlayerA});

//   final String name;
//   final bool isPlayerA;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     // return Container(
//     // color: theme.colorScheme.primary,
//     // shadowColor: theme.colorScheme.primary,
//     // surfaceTintColor: theme.colorScheme.primary,

//     // shape: RoundedRectangleBorder(
//     //   borderRadius: BorderRadiusGeometry.directional(
//     //     topStart: Radius.elliptical(20, 15),
//     //     topEnd: Radius.elliptical(20, 15),
//     //   ),
//     // ),

//     // height: 20,
//     // width: 100,
//     // child: DecoratedBox(
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.elliptical(20.0, 8.0),
//           topRight: Radius.elliptical(20.0, 8.0),
//         ),

//         border: Border.all(color: theme.colorScheme.primary, width: 5),
//         color: theme.colorScheme.primary,
//       ),

//       child: Padding(
//         // padding: const EdgeInsets.all(8.0),
//         padding: const EdgeInsets.only(
//           right: 20.0,
//           left: 20.0,
//           top: 8.0,
//           bottom: 8.0,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: isPlayerA
//                   ? MainAxisAlignment.start
//                   : MainAxisAlignment.end,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       // ),
//     );
//   }
// }

// class ScoredTitle extends StatelessWidget {
//   const ScoredTitle({super.key, required this.scoredTitle});

//   final String scoredTitle;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Container(
//       color: theme.colorScheme.primary,
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.elliptical(20.0, 8.0),
//             topRight: Radius.elliptical(20.0, 8.0),
//           ),
//           border: Border.all(color: theme.colorScheme.primary),
//           color: theme.colorScheme.inversePrimary,
//         ),

//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 scoredTitle,
//                 style: TextStyle(color: theme.colorScheme.onPrimary),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ScoredItem extends StatelessWidget {
//   const ScoredItem({super.key, required this.scoreValue});
//   // : _height = scoreValue == null ? null : 30;

//   final int? scoreValue;
//   // final double? _height;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return DecoratedBox(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: theme.colorScheme.onPrimaryContainer,
//           width: 0.2,
//         ),
//         color: (scoreValue == null)
//             ? theme.colorScheme.primary
//             : theme.colorScheme.inversePrimary,
//         borderRadius: BorderRadius.all(Radius.circular(5)),
//       ),

//       child: TextField(
//         style: TextStyle(fontSize: 19),
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           isDense: true,
//           contentPadding: EdgeInsets.all(0),
//           hintText: (scoreValue == null) ? "" : "Enter score",
//         ),
//         onSubmitted: (text) {
//           print('onSubmitted: $text (${text.characters.length})');
//         },
//       ),
//     );
//   }
// }

// class Scored extends StatelessWidget {
//   const Scored({super.key, required this.currentScoreUpdate});

//   final List<int> currentScoreUpdate;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return DecoratedBox(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.elliptical(20.0, 8.0),
//           bottomRight: Radius.elliptical(20.0, 8.0),
//         ),

//         border: Border.all(color: theme.colorScheme.primary),
//         color: theme.colorScheme.primary,
//       ),

//       child: ListView(
//         children: [
//           for (int s = 0; s <= currentScoreUpdate.length; s++)
//             ScoredItem(scoreValue: (s == 0) ? null : currentScoreUpdate[s]),
//         ],
//         // padding: const EdgeInsets.all(8.0),
//         // children: <Widget>[
//         //   for (int s = 0; s <= currentScoreUpdate.length; s++)
//         //   ListTile(
//         //         visualDensity: VisualDensity.compact,
//         //         title: ScoreItem(scoreValue: (s == 0) ? null : currentScoreUpdate[s-1]),
//         //         titleAlignment: ListTileTitleAlignment.center,
//         //   ),
//         // ],
//       ),
//     );
//   }
// }

// class ToGoTitle extends StatelessWidget {
//   const ToGoTitle({super.key, required this.toGoTitle});

//   final String toGoTitle;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Container(
//       color: theme.colorScheme.primary,

//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.elliptical(20.0, 8.0),
//             topRight: Radius.elliptical(20.0, 8.0),
//           ),
//           border: Border.all(color: theme.colorScheme.primary),
//           color: theme.colorScheme.inversePrimary,
//         ),

//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 toGoTitle,
//                 style: TextStyle(color: theme.colorScheme.primary),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ToGoItem extends StatelessWidget {
//   const ToGoItem({super.key, required this.toGoValue});

//   final int? toGoValue;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return DecoratedBox(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: theme.colorScheme.onPrimaryContainer,
//           width: 0.2,
//         ),
//         color: (toGoValue == null)
//             ? theme.colorScheme.inversePrimary
//             : theme.colorScheme.primaryContainer,
//         borderRadius: BorderRadius.all(Radius.circular(5)),
//       ),

//       child: Text(
//         (toGoValue == null) ? "" : toGoValue.toString(),
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: theme.colorScheme.onPrimaryContainer,
//           fontSize: 20,
//         ),
//       ),
//     );
//   }
// }

// class ToGoCounter extends StatelessWidget {
//   const ToGoCounter({
//     super.key,
//     required this.toGoUpdate,
//     required this.startScore,
//   });

//   final List<int> toGoUpdate;
//   final int startScore;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Container(
//       // color: theme.colorScheme.primary,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.elliptical(20.0, 8.0),
//           bottomRight: Radius.elliptical(20.0, 8.0),
//         ),
//         color: theme.colorScheme.primary,
//       ),

//       // color: Colors.deepOrange,
//       // shadowColor: theme.colorScheme.primary,
//       // surfaceTintColor: theme.colorScheme.primary,
//       child: Padding(
//         padding: const EdgeInsets.all(0.8),

//         // child: Column(
//         //       mainAxisAlignment: MainAxisAlignment.center,
//         //       mainAxisSize: MainAxisSize.min,
//         //       children: [
//         child: ListView(
//           children: [for (int u in toGoUpdate) ToGoItem(toGoValue: u)],
//         ),
//         //   ],
//         // ),
//         //   Row(
//         //     mainAxisAlignment: MainAxisAlignment.center,
//         //     mainAxisSize: MainAxisSize.min,
//         //     children: [Text(startScore.toString())],
//         //   ),

//         //   for (int togo in toGoUpdate)
//         //     Row(
//         //       mainAxisAlignment: MainAxisAlignment.center,
//         //       mainAxisSize: MainAxisSize.min,
//         //       children: [Text(togo.toString())],
//         //     ),
//         // ],
//         // ),
//       ),
//     );
//   }
// }

// class PlayerStatsTitle extends StatelessWidget {
//   const PlayerStatsTitle({super.key, required this.statsTitle});

//   final String statsTitle;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Container(
//       color: theme.colorScheme.primary,

//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.elliptical(20.0, 8.0),
//             topRight: Radius.elliptical(20.0, 8.0),
//           ),
//           border: Border.all(color: theme.colorScheme.primary),
//           color: theme.colorScheme.inversePrimary,
//         ),

//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 statsTitle,
//                 style: TextStyle(color: theme.colorScheme.primary),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PlayerStats extends StatelessWidget {
//   const PlayerStats({super.key, required this.stats});

//   // final List<int> stats;
//   final Map<String, int> stats;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     // return Container(
//     //   decoration: BoxDecoration(
//     //     borderRadius: BorderRadius.only(
//     //       bottomLeft: Radius.elliptical(20.0, 8.0),
//     //       bottomRight: Radius.elliptical(20.0, 8.0),
//     //     ),
//     //     border: Border.all(color: theme.colorScheme.primary),
//     //     color: theme.colorScheme.secondaryFixed,
//     //   ),
//     // color: Colors.deepOrange,
//     // shadowColor: theme.colorScheme.primary,
//     // surfaceTintColor: theme.colorScheme.primary,
//     // child: Padding(
//     //   padding: const EdgeInsets.all(0.8),

//     // child: Expanded(
//     // child: Container(
//     //   height: 150,

//     // return Text('${item.key}: ${item.value}') for item in stats.entries;

//     return Flexible(
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         // shrinkWrap: true,
//         itemCount: stats.length,
//         itemBuilder: (context, index) {
//           final item = stats.entries.elementAt(index);
//           return SizedBox(
//             height: 10,
//             child: Text("${item.key}: ${item.value}"),
//           );
//         },
//       ),
//       // ]
//       // children: [
//       // ],
//     );

//     // return ListView.builder(
//     //   itemCount: stats.length,
//     //   itemBuilder: (context, index) {
//     //     return SizedBox(height: 50, child: Text("${stats["Start Value"]}\n"));
//     //   },

//     // ),
//     // Container(child: Text("1"));
//     // Container(child: Text("2"));
//     // },

//     // shrinkWrap: true,
//     // constraints: BoxConstraints.expand(height: double.infinity)

//     // children: [
//     //   for (MapEntry<String, int> item in stats.entries)
//     //     SizedBox(height: 10, child: Text("${item.key}\n")),],
//     // ),
//     // ),
//     // child: Expanded(
//     //   child: Column(
//     //     children: [
//     //       for (MapEntry<String, int> item in stats.entries)
//     //         Card(child: Text("hello", textAlign: TextAlign.center, style: TextStyle(color: theme.colorScheme.onSecondaryFixed))),
//     //         // Text("${item.key}: ${item.value}"),
//     //     ],
//     //     // child: ListView.builder(
//     //     //   // shrinkWrap: true,
//     //     //   itemCount: abc.length,

//     //     //   itemBuilder: (context, abc) {
//     //     //     return Text('iten ${abc}');
//     //     //   },
//     //     // children: [
//     //     //   for (MapEntry<String, int> item in stats.entries)
//     //     //     Text(
//     //     //       "${item.key}: ${item.value}",
//     //     //       textAlign: TextAlign.center,
//     //     //       style: TextStyle(color: theme.colorScheme.onSecondaryFixed),
//     //     //     ),
//     //     // ],
//     //     // ),
//     //     // constraints: BoxConstraints.expand(height: double.infinity),
//     //     // child: IntrinsicHeight(
//     //     //   child: Column(
//     //     //     // crossAxisAlignment: CrossAxisAlignment.stretch,
//     //     //     children: [for (int stat in stats) Text("This stat: $stat")],
//     //     //   ),
//     //   ),
//     // ),
//     // ),
//     // );
//   }
// }

// class PlayerRemainder extends StatelessWidget {
//   const PlayerRemainder({super.key, required this.remainder});

//   final int remainder;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Card(
//       color: theme.colorScheme.inverseSurface,
//       child: Text(
//         "$remainder",
//         style: TextStyle(fontSize: 40, color: theme.colorScheme.surface),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

// class FnKeys extends StatelessWidget {
//   const FnKeys({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [Text("Shortcuts")],
//       ),
//     );
//   }
// }

// class PlayerSection extends StatelessWidget {
//   const PlayerSection({super.key, required this.player});

//   final PlayerInfo player;

//   @override
//   Widget build(BuildContext context) {
//     // Map<String:Widget> PlayerData;
//     // Create a list of widgets to be able to display in the desired order
//     Map<String, Column> playerInfoToDisplay = {
//       "PlayerStats": Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           // Text("Stats")
//           PlayerStatsTitle(statsTitle: "${player.name} stats"),
//           // Expanded(child: PlayerStats(stats: player.stats)),
//         ],
//       ),

//       "PlayerScored": Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           ScoredTitle(scoredTitle: "Scored"),
//           // Scored(currentScoreUpdate: player.scored),
//         ],
//       ),

//       "PlayerToGo": Column(
//         children: [
//           ToGoTitle(toGoTitle: "To go"),
//           // ToGoCounter(toGoUpdate: player.toGo, startScore: player.startValue),
//         ],
//       ),
//     };

//     return Container(
//       padding: EdgeInsets.all(8.0),

//       child: Column(
//         children: [
//           PlayerName(name: player.name, isPlayerA: player.iD),

//           player.iD
//               ? // Display the order of the columns depending on the player
//                 Row(
//                   children: [
//                     // Text("Player A"),
//                     Expanded(
//                       flex: 3,
//                       child: playerInfoToDisplay["PlayerStats"]!,
//                     ),
//                     // child: PlayerStats(stats: player.stats)),
//                     Expanded(
//                       flex: 1,
//                       child: playerInfoToDisplay["PlayerScored"]!,
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: playerInfoToDisplay["PlayerToGo"]!,
//                     ),
//                   ],
//                 )
//               : Row(
//                   children: [
//                     // Text("Player B"),
//                     Expanded(
//                       flex: 1,
//                       child: playerInfoToDisplay["PlayerScored"]!,
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: playerInfoToDisplay["PlayerToGo"]!,
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: playerInfoToDisplay["PlayerStats"]!,
//                     ),
//                   ],
//                 ),

//           PlayerRemainder(remainder: player.remainder()),
//         ],
//       ),
//     );
//   }
// }

class DartsAppBar extends StatelessWidget {
  const DartsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Darts Counter'),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  PlayerInfo playerA = PlayerInfo(iD: true, name: "player A", startValue: 701);
  PlayerInfo playerB = PlayerInfo(iD: false, name: "player B", startValue: 501);

  // // final int playerAStart = 701;
  // // final int playerBStart = 701;

  // // List<int> playerAScored = [];
  // // List<int> playerBScored = [];

  // // List<int> playerARemainder = [];
  // // List<int> playerBRemainder = [];

  // // final String playerAName = "Player A";
  // // final String playerBName = "Player B";

  bool remainderARemainsPositiveAfterScored(int value) {
    // return (playerARemainder[playerARemainder.length - 1] - value) > 0;
    return (playerA.remainder() - value) > 0;
  }

  bool remainderBRemainsPositiveAfterScored(int value) {
    return (playerB.remainder() - value) > 0;
  }

  void recordAScore(int value) {
    setState(() {
      int remainder = playerA.remainder() - value;
      // if (remainder < 0) return false;
      if (remainderARemainsPositiveAfterScored(value)) {
        playerA.scored.add(value);
        playerA.toGo.add(remainder);
      }
      // return true;
    });
  }

  void recordBScore(int value) {
    setState(() {
      int remainder = playerB.remainder() - value;
      // if (remainder < 0) return false;

      if (remainderBRemainsPositiveAfterScored(value)) {
        playerB.scored.add(value);
        playerB.toGo.add(remainder);
      }
      // return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (playerA.toGo.isEmpty) playerARemainder.add(playerAStart);
    // if (playerBRemainder.isEmpty) playerBRemainder.add(playerBStart);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // backgroundColor: Colors.transparent,
        title: const Text('Darts Counter'),
      ),

      body:
          Stack( children: [
            Container(
            alignment: Alignment.center,
            child: Background()
          ),
          Container(
            // child: Row(
            // alignment: Alignment.center,
            child:
                // PlayerSection(player: playerA),
                // PlayerSection(player: playerA),
                // PlayerStatsSection(player: playerA)
                // PlayerScoredSection(scored: playerA.scored),
                // PlayerToGoSection(toGo: playerA.toGo)
                PlayerDebugSection(player: playerA)
          ),
          ])
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
