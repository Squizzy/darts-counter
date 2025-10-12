import 'package:first_app/player_class.dart';
import 'package:flutter/material.dart';

import 'dart:developer';

class PlayerScoredTitle extends StatelessWidget {
  const PlayerScoredTitle({super.key, required this.scoredTitle});

  final String scoredTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.primary, // background behind
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.inversePrimary, // background of inside tab
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(20.0, 8.0),
            topRight: Radius.elliptical(20.0, 8.0),
          ),
          border: Border.all(color: theme.colorScheme.primary),
        ),

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            scoredTitle,
            style: TextStyle(color: theme.colorScheme.primary),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}

class PlayerScoredItem extends StatelessWidget {
  const PlayerScoredItem({super.key, required this.scoreValue});
  // : _height = scoreValue == null ? null : 30;

  final int? scoreValue;
  // final double? _height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onPrimaryContainer,
          width: 0.2,
        ),
        color: (scoreValue == null)
            ? theme.colorScheme.inversePrimary
            : theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),

      child: TextField(
        style: TextStyle(
          fontSize: 19,
          color: (scoreValue == null)
              ? theme.colorScheme.inversePrimary
              : theme.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(0),
          hintText: (scoreValue == null)
              ? "Enter score"
              : scoreValue.toString(),
          hintStyle: TextStyle(
            color: (scoreValue == null)
                ? theme.colorScheme.inversePrimary
                : theme.colorScheme.primary,
          ),
        ),
        onSubmitted: (text) {
          log(
            'onSubmitted: $text (${text.characters.length})',
            name: "PlayerScoredItem",
          );
        },
      ),
    );
  }
}

class PlayerScoredList extends StatelessWidget {
  const PlayerScoredList({super.key, required this.player});
  // const PlayerScoredList({super.key, required this.scoredPointsList});

  // final List<int> scoredPointsList;

  final PlayerInfo player;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(20.0, 8.0),
          bottomRight: Radius.elliptical(20.0, 8.0),
        ),

        border: Border.all(color: theme.colorScheme.primary),
        color: theme.colorScheme.primary,
      ),

      child: Column(
        children: [
          for (int scoredPoints in player.scored)
            PlayerScoredItem(scoreValue: scoredPoints),
          PlayerScoredItem(scoreValue: null),
        ],
      ),
    );
  }
}

class PlayerScoredSection extends StatelessWidget {
  const PlayerScoredSection({super.key, required this.player});

  final PlayerInfo player;

  @override
  Widget build(BuildContext context) {
    // return PlayerScoredTitle(scoredTitle: "Scored");
    // return PlayerScoredItem(scoreValue: null);
    // return PlayerScoredList(scoredPointsList: player.scored);
    return Column(
      children: [
        PlayerScoredTitle(scoredTitle: "Scored"),
        // PlayerScoredItem(scoreValue: (player.scored.isEmpty) ? null : player.scored[2]),
        PlayerScoredList(player: player),
      ],
    );
  }
}
