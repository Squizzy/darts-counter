import 'dart:developer';

import 'package:flutter/material.dart';

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
            ? theme.colorScheme.primary
            : theme.colorScheme.inversePrimary,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),

      child: TextField(
        style: TextStyle(fontSize: 19),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(0),
          hintText: (scoreValue == null) ? "" : "Enter score",
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

class PlayerScoredSection extends StatelessWidget {
  const PlayerScoredSection({super.key, required this.scored});

  final List<int> scored;

  @override
  Widget build(BuildContext context) {
    return PlayerScoredTitle(scoredTitle: "Scored");
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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(20.0, 8.0),
          bottomRight: Radius.elliptical(20.0, 8.0),
        ),

        border: Border.all(color: theme.colorScheme.primary),
        color: theme.colorScheme.primary,
      ),

      child: ListView(
        children: [
          for (int s = 0; s <= currentScoreUpdate.length; s++)
            PlayerScoredItem(
              scoreValue: (s == 0) ? null : currentScoreUpdate[s],
            ),
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
