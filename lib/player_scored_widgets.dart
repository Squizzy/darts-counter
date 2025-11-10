import 'package:first_app/player_class.dart';
import 'package:flutter/material.dart';

import 'package:logging/logging.dart';
final Logger log = Logger("player_scored_widget");

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

class PlayerScoredInitialSpace extends StatelessWidget {
  const PlayerScoredInitialSpace({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
      return Padding(
        padding: EdgeInsets.all(0.0),
        child: Container(
        height: 30,
        width: double.infinity,
        alignment: Alignment.center,

        child: Text(
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
          "",
        ),
      ),
    );
  }
}

class PlayerScoredItem extends StatefulWidget {
  const PlayerScoredItem({
    super.key,
    required this.player,
    required this.scoreValue,
  });

  final PlayerInfo player;
  final int? scoreValue;

  @override
  State<StatefulWidget> createState() => _PlayerScoredItem();
}

class _PlayerScoredItem extends State<PlayerScoredItem> {
  // _PlayerScoredItem({required this.player, required this.scoreValue});
  // const PlayerScoredItem({super.key, required this.player, required this.scoreValue});

  // const PlayerScoredItem({
  //   super.key,
  //   required this.player,
  //   required this.scoreValue,
  // });
  // final PlayerInfo player = player;
  // : _height = scoreValue == null ? null : 30;

  // int? scoreValue = widget.scoreValue;
  // final double? _height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController myController = TextEditingController();

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onPrimaryContainer,
          width: 2,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
        color: (widget.scoreValue == null)
            ? theme.colorScheme.inversePrimary
            : theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),

      child: Container(
        height: 30,
        alignment: Alignment.center,
        child: TextField(
          controller: myController,
          style: TextStyle(
            fontSize: 15,
            color: (widget.scoreValue == null)
                ? theme.colorScheme.primary
                : theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),

          textAlign: TextAlign.center,

          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.all(0),
            hintText: (widget.scoreValue == null)
                ? "Enter score"
                : widget.scoreValue.toString(),
            hintStyle: TextStyle(
              color: (widget.scoreValue == null)
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary,
              fontSize: 15,
            ),
            // hintFadeDuration: Duration(seconds: 2),
          ),

          onSubmitted: (text) {
            if (int.tryParse(text) != null) {
              widget.player.scoredList.add(int.parse(text));
            }
            // setState(() {
            log.info(
              '_PlayerScoredItem widget.player.scoredList: ${widget.player.scoredList}',
            );
            setState(() {
              widget.player.recalculateToGo();
            });
            log.info(
              '_PlayerScoredItem widget.player.toGo: ${widget.player.toGo}',
            );
            // (context as Element).markNeedsBuild();
            log.info(
              '_PlayerScoredItem onSubmitted: $text (${text.characters.length})',
            );
          },
        ),
      ),
    );
  }
}

class PlayerScoredList extends StatefulWidget {
  const PlayerScoredList({
    super.key,
    required this.player,
  });

  final PlayerInfo player;

  @override
  State<StatefulWidget> createState() => _PlayerScoredList();
}

class _PlayerScoredList extends State<PlayerScoredList> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    log.finer("Preparing ${widget.player.name} scored list");

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(20.0, 8.0),
          bottomRight: Radius.elliptical(20.0, 8.0),
        ),

        border: Border.all(color: theme.colorScheme.primary),
        color: theme.colorScheme.primary,
      ),

       child: ListView.builder(
        itemCount: widget.player.scoredToDisplay().length + 1,
        itemBuilder:(context, index) {
          return (index == 0)
            ? PlayerScoredInitialSpace()
            : PlayerScoredItem(
                player: widget.player, 
                scoreValue: widget.player.scoredToDisplay()[index - 1],
                onChanged: () => setState(() {}));
        },
      )
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
        Expanded(child: PlayerScoredList(player: player)),
      ],
    );
  }
}
