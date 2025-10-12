import 'package:first_app/player_class.dart';
import 'package:flutter/material.dart';

class PlayerToGoTitle extends StatelessWidget {
  const PlayerToGoTitle({super.key, required this.toGoTitle});

  final String toGoTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.primary,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.inversePrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(20.0, 8.0),
            topRight: Radius.elliptical(20.0, 8.0),
          ),
          border: Border.all(color: theme.colorScheme.primary),
        ),

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            toGoTitle,
            style: TextStyle(color: theme.colorScheme.primary),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class PlayerToGoItem extends StatelessWidget {
  const PlayerToGoItem({super.key, required this.toGoValue});

  final int? toGoValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onPrimaryContainer,
          width: 0.2,
        ),
        color: (toGoValue == null)
            ? theme.colorScheme.inversePrimary
            : theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          (toGoValue == null) ? "" : toGoValue.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: theme.colorScheme.onPrimaryContainer,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class PlayerToGoList extends StatelessWidget {
  const PlayerToGoList({super.key, required this.player});
  final PlayerInfo player;

  // const PlayerToGoList({super.key, required this.toGoUpdate, required this.startScore,});

  // final List<int> toGoUpdate;
  // final int startScore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      // color: theme.colorScheme.primary,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(20.0, 8.0),
          bottomRight: Radius.elliptical(20.0, 8.0),
        ),
        color: theme.colorScheme.primary,
      ),

      // color: Colors.deepOrange,
      // shadowColor: theme.colorScheme.primary,
      // surfaceTintColor: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(0.8),
        child: Column(children: [
          for (int scoreToGo in player.toGo)
            PlayerToGoItem(toGoValue: scoreToGo)
        ],)
        // child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        // child: ListView(
        //   children: [for (int u in toGoUpdate) PlayerToGoItem(toGoValue: u)],
        // ),
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

class PlayerToGoSection extends StatelessWidget {
  const PlayerToGoSection({super.key, required this.player});

  final PlayerInfo player;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayerToGoTitle(toGoTitle: "To go"),
        // PlayerToGoItem(toGoValue: player.toGo[0]),
        PlayerToGoList(player: player),
      ],
    );
  }
}
