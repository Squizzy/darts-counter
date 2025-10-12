import 'package:flutter/material.dart';
import 'player_class.dart';
import 'player_stats_widgets.dart';
import 'player_scored_widgets.dart';
import 'player_togo_widgets.dart';
import 'player_name.dart';
import 'player_remainder.dart';

class PlayerDebugSection extends StatelessWidget {
  const PlayerDebugSection({super.key, required this.player});

  final PlayerInfo player;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayerName(name: player.name, isPlayerA: player.iD),

        player.iD
            ? Row(
                children: [
                  Expanded(flex: 3, child: PlayerStatsSection(player: player)),
                  Expanded(
                    flex: 1,
                    child: PlayerScoredSection(scored: player.scored),
                  ),
                  Expanded(
                    flex: 1,
                    child: PlayerToGoSection(toGo: player.toGo),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PlayerScoredSection(scored: player.scored),
                  ),
                  Expanded(
                    flex: 1,
                    child: PlayerToGoSection(toGo: player.toGo),
                  ),
                  Expanded(flex: 3, child: PlayerStatsSection(player: player)),
                ],
              ),
      ],
    );
  }
}

class PlayerSection extends StatelessWidget {
  const PlayerSection({super.key, required this.player});

  final PlayerInfo player;

  @override
  Widget build(BuildContext context) {
    // Map<String:Widget> PlayerData;
    // Create a list of widgets to be able to display in the desired order
    Map<String, Column> playerInfoToDisplay = {
      "PlayerStats": Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Text("Stats")
          PlayerStatsTitle(statsTitle: "${player.name} stats"),
          // Expanded(child: PlayerStats(stats: player.stats)),
        ],
      ),

      "PlayerScored": Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          PlayerScoredTitle(scoredTitle: "Scored"),
          // Scored(currentScoreUpdate: player.scored),
        ],
      ),

      "PlayerToGo": Column(
        children: [
          ToGoTitle(toGoTitle: "To go"),
          // ToGoCounter(toGoUpdate: player.toGo, startScore: player.startValue),
        ],
      ),
    };

    return Container(
      padding: EdgeInsets.all(8.0),

      child: Column(
        children: [
          PlayerName(name: player.name, isPlayerA: player.iD),

          player.iD
              ? // Display the order of the columns depending on the player
                Row(
                  children: [
                    // Text("Player A"),
                    Expanded(
                      flex: 3,
                      child: playerInfoToDisplay["PlayerStats"]!,
                    ),
                    // child: PlayerStats(stats: player.stats)),
                    Expanded(
                      flex: 1,
                      child: playerInfoToDisplay["PlayerScored"]!,
                    ),
                    Expanded(
                      flex: 1,
                      child: playerInfoToDisplay["PlayerToGo"]!,
                    ),
                  ],
                )
              : Row(
                  children: [
                    // Text("Player B"),
                    Expanded(
                      flex: 1,
                      child: playerInfoToDisplay["PlayerScored"]!,
                    ),
                    Expanded(
                      flex: 1,
                      child: playerInfoToDisplay["PlayerToGo"]!,
                    ),
                    Expanded(
                      flex: 3,
                      child: playerInfoToDisplay["PlayerStats"]!,
                    ),
                  ],
                ),

          PlayerRemainder(remainder: player.remainder()),
        ],
      ),
    );
  }
}
