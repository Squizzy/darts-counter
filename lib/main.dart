import 'package:flutter/material.dart';

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

class PlayerName extends StatelessWidget {
  const PlayerName({super.key, required this.name, required this.isPlayer1});

  final String name;
  final bool isPlayer1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // return Container(
    // color: theme.colorScheme.primary,
    // shadowColor: theme.colorScheme.primary,
    // surfaceTintColor: theme.colorScheme.primary,

    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadiusGeometry.directional(
    //     topStart: Radius.elliptical(20, 15),
    //     topEnd: Radius.elliptical(20, 15),
    //   ),
    // ),

    // height: 20,
    // width: 100,
    // child: DecoratedBox(
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(20.0, 8.0),
          topRight: Radius.elliptical(20.0, 8.0),
        ),

        border: Border.all(color: theme.colorScheme.primary, width: 5),
        color: theme.colorScheme.primary,
      ),

      child: Padding(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(
          right: 20.0,
          left: 20.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: isPlayer1
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

class ScoredTitle extends StatelessWidget {
  const ScoredTitle({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(20.0, 8.0),
            topRight: Radius.elliptical(20.0, 8.0),
          ),
          border: Border.all(color: theme.colorScheme.primary),
          color: theme.colorScheme.inversePrimary,
        ),

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name, style: TextStyle(color: theme.colorScheme.primary)),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreItem extends StatelessWidget {
  const ScoreItem({super.key, required this.scoreValue});

  final int? scoreValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary),
        color: (scoreValue == null)
            ? theme.colorScheme.primary
            : theme.colorScheme.inversePrimary,
      ),

      child: Text(
        (scoreValue == null) ? " " : scoreValue.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class Scored extends StatelessWidget {
  const Scored({super.key, required this.currentScoreUpdate});

  final List<int> currentScoreUpdate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary),
        color: theme.colorScheme.primary,
      ),

      child: ListView(
        children: [
          for (int s = 0; s <= currentScoreUpdate.length; s++)
            ScoreItem(scoreValue: (s == 0) ? null : currentScoreUpdate[s - 1]),
        ],
        // padding: const EdgeInsets.all(8.0),
        // children: <Widget>[
        //   for (int s = 0; s <= currentScoreUpdate.length; s++)
        //   ListTile(
        //         visualDensity: VisualDensity.compact,
        //         title: ScoreItem(scoreValue: (s == 0) ? null : currentScoreUpdate[s-1]),
        //         titleAlignment: ListTileTitleAlignment.center,
        //   ),
        // ],
      ),
    );
  }
}

class ToGoTitle extends StatelessWidget {
  const ToGoTitle({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(20.0, 8.0),
            topRight: Radius.elliptical(20.0, 8.0),
          ),
          border: Border.all(color: theme.colorScheme.primary),
          color: theme.colorScheme.inversePrimary,
        ),

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name, style: TextStyle(color: theme.colorScheme.primary)),
            ],
          ),
        ),
      ),
    );
  }
}

class ToGoItem extends StatelessWidget {
  const ToGoItem({super.key, required this.toGoValue});

  final int? toGoValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primaryContainer),
        color: (toGoValue == null)
            ? theme.colorScheme.inversePrimary
            : theme.colorScheme.primary,
      ),

      child: Text(
        (toGoValue == null) ? "" : toGoValue.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
      ),
    );
  }
}

class ToGoCounter extends StatelessWidget {
  const ToGoCounter({
    super.key,
    required this.toGoUpdate,
    required this.startScore,
  });

  final List<int> toGoUpdate;
  final int startScore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.primary,

      // color: Colors.deepOrange,
      // shadowColor: theme.colorScheme.primary,
      // surfaceTintColor: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(0.8),

        // child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        child: ListView(
          children: [for (int u in toGoUpdate) ToGoItem(toGoValue: u)],
        ),
        //   ],
        // ),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [Text(startScore.toString())],
        //   ),

        //   for (int togo in toGoUpdate)
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       mainAxisSize: MainAxisSize.min,
        //       children: [Text(togo.toString())],
        //     ),
        // ],
        // ),
      ),
    );
  }
}

class PlayerStatsTitle extends StatelessWidget {
  const PlayerStatsTitle({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(20.0, 8.0),
            topRight: Radius.elliptical(20.0, 8.0),
          ),
          border: Border.all(color: theme.colorScheme.primary),
          color: theme.colorScheme.inversePrimary,
        ),

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name, style: TextStyle(color: theme.colorScheme.primary)),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerStats extends StatelessWidget {
  const PlayerStats({super.key, required this.stats});

  final List<int> stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.secondaryFixed,

      // color: Colors.deepOrange,
      // shadowColor: theme.colorScheme.primary,
      // surfaceTintColor: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(0.8),

        child: ListView(
          children: [
            for (int item in stats)
              Text(
                "This stat: $item",
                textAlign: TextAlign.center,
                style: TextStyle(color: theme.colorScheme.onSecondaryFixed),
              ),
          ],
        ),
        // constraints: BoxConstraints.expand(height: double.infinity),
        // child: IntrinsicHeight(
        //   child: Column(
        //     // crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [for (int stat in stats) Text("This stat: $stat")],
        //   ),
      ),
    );
  }
}

class PlayerRemainder extends StatelessWidget {
  const PlayerRemainder({super.key, required this.remainder});

  final int remainder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.inverseSurface,
      child: Text(
        "$remainder",
        style: TextStyle(fontSize: 40, color: theme.colorScheme.surface),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class FnKeys extends StatelessWidget {
  const FnKeys({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Function Keys")],
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Darts Counter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Players names area
            Row(
              children: [
                Expanded(child: PlayerName(name: 'Player A', isPlayer1: true)),
                SizedBox(width: 40),
                Expanded(child: PlayerName(name: 'Player B', isPlayer1: false)),
              ],
            ),

            Row(
              children: [
                Expanded(flex: 3, child: PlayerStatsTitle(name: "Stats")),
                Expanded(child: ScoredTitle(name: "Score")),
                Expanded(child: ToGoTitle(name: "To Go")),
                SizedBox(width: 40),
                Expanded(child: ScoredTitle(name: "Score")),
                Expanded(child: ToGoTitle(name: "To Go")),
                Expanded(flex: 3, child: PlayerStatsTitle(name: "Stats")),
              ],
            ),
            // Players Statistics, scored values, score to go
            Expanded(
              child: Row(
                children: [
                  Expanded(flex: 3, child: PlayerStats(stats: [3, 9, 12])),
                  Expanded(child: Scored(currentScoreUpdate: [5, 4, 3])),
                  Expanded(
                    child: ToGoCounter(
                      // currentScoreUpdate: [5, 4, 3],
                      toGoUpdate: [15, 11, 8, 5],
                      startScore: 501,
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: Scored(
                      currentScoreUpdate: [5, 4, 3],
                      // toGo: [15, 11, 8],
                      // startScore: 501,
                    ),
                  ),
                  Expanded(
                    child: ToGoCounter(
                      toGoUpdate: [15, 11, 8, 7],
                      startScore: 501,
                    ),
                  ),
                  Expanded(flex: 3, child: PlayerStats(stats: [20, 3, 7])),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: PlayerRemainder(remainder: 27)),
                SizedBox(width: 40),
                Expanded(child: PlayerRemainder(remainder: 200)),
              ],
            ),

            Row(children: [Expanded(child: FnKeys())]),

            // const Text('You have pushed the button this many times:'),
            // Text('$_counter', style: Theme.of(context).textTheme.headlineMedium,),

            // Row(
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
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Increment', child: const Icon(Icons.add),),
    );
  }
}
