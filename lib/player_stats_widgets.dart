import 'package:first_app/player_class.dart';
import 'package:flutter/material.dart';

class PlayerStatsTitle extends StatelessWidget {
  const PlayerStatsTitle({super.key, required this.statsTitle});

  final String statsTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.primary, // Background behind
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.inversePrimary, // background
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(20.0, 8.0),
            topRight: Radius.elliptical(20.0, 8.0),
          ),
          border: Border.all(color: theme.colorScheme.primary),
        ),

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            statsTitle,
            style: TextStyle(color: theme.colorScheme.primary),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class PlayerStatsItem extends StatelessWidget {
  const PlayerStatsItem({super.key, required this.item});

  final MapEntry<String, int> item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.inversePrimary,
        border: Border.all(color: theme.colorScheme.inversePrimary),
      ),
      height: 20,
      child: Text(
        "${item.key}: ${item.value}",
        textAlign: TextAlign.left,
        style: TextStyle(color: theme.colorScheme.primary),
      ),
    );
  }
}

class PlayerStatsList extends StatelessWidget {
  const PlayerStatsList({super.key, required this.stats});

  // final List<int> stats;
  final Map<String, int> stats;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.elliptical(20.0, 8.0),
    //       bottomRight: Radius.elliptical(20.0, 8.0),
    //     ),
    //     border: Border.all(color: theme.colorScheme.primary),
    //     color: theme.colorScheme.secondaryFixed,
    //   ),
    // color: Colors.deepOrange,
    // shadowColor: theme.colorScheme.primary,
    // surfaceTintColor: theme.colorScheme.primary,
    // child: Padding(
    //   padding: const EdgeInsets.all(0.8),

    // child: Expanded(
    // child: Container(
    //   height: 150,

    // return Text('${item.key}: ${item.value}') for item in stats.entries;

    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final item = stats.entries.elementAt(index);
          return SizedBox(
            height: 10,
            child: Text("${item.key}: ${item.value}"),
          );
        },
      ),
      // ]
      // children: [
      // ],
    );

    // return ListView.builder(
    //   itemCount: stats.length,
    //   itemBuilder: (context, index) {
    //     return SizedBox(height: 50, child: Text("${stats["Start Value"]}\n"));
    //   },

    // ),
    // Container(child: Text("1"));
    // Container(child: Text("2"));
    // },

    // shrinkWrap: true,
    // constraints: BoxConstraints.expand(height: double.infinity)

    // children: [
    //   for (MapEntry<String, int> item in stats.entries)
    //     SizedBox(height: 10, child: Text("${item.key}\n")),],
    // ),
    // ),
    // child: Expanded(
    //   child: Column(
    //     children: [
    //       for (MapEntry<String, int> item in stats.entries)
    //         Card(child: Text("hello", textAlign: TextAlign.center, style: TextStyle(color: theme.colorScheme.onSecondaryFixed))),
    //         // Text("${item.key}: ${item.value}"),
    //     ],
    //     // child: ListView.builder(
    //     //   // shrinkWrap: true,
    //     //   itemCount: abc.length,

    //     //   itemBuilder: (context, abc) {
    //     //     return Text('iten ${abc}');
    //     //   },
    //     // children: [
    //     //   for (MapEntry<String, int> item in stats.entries)
    //     //     Text(
    //     //       "${item.key}: ${item.value}",
    //     //       textAlign: TextAlign.center,
    //     //       style: TextStyle(color: theme.colorScheme.onSecondaryFixed),
    //     //     ),
    //     // ],
    //     // ),
    //     // constraints: BoxConstraints.expand(height: double.infinity),
    //     // child: IntrinsicHeight(
    //     //   child: Column(
    //     //     // crossAxisAlignment: CrossAxisAlignment.stretch,
    //     //     children: [for (int stat in stats) Text("This stat: $stat")],
    //     //   ),
    //   ),
    // ),
    // ),
    // );
  }
}

class PlayerStatsSection extends StatelessWidget {
  const PlayerStatsSection({super.key, required this.player});

  final PlayerInfo player;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PlayerStatsTitle(statsTitle: "${player.name} Stats"),

        Expanded(
          child: Column(
            children: [
              for (MapEntry<String, int> item in player.stats.entries)
                PlayerStatsItem(item: item),
            ],
          ),
        ),
      ],
    );
  }
}
