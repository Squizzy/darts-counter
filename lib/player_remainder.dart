import 'package:first_app/player_class.dart';
import 'package:flutter/material.dart';

import 'package:logging/logging.dart';

final Logger log = Logger("player_remainder_widget");

class PlayerRemainder extends StatelessWidget {
  const PlayerRemainder({super.key, required this.player});

  final PlayerInfo player;

  @override
  Widget build(BuildContext context) {
    log.finer("Preparing ${player.name} remainder");

    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(0.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.inverseSurface,
        ),

        child: Text(
          "${player.remainder()}",
          style: TextStyle(fontSize: 40, color: theme.colorScheme.surface),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
