import 'package:flutter/material.dart';
import 'player_class.dart';
import 'player_stats_widgets.dart';
import 'player_scored_widgets.dart';
import 'player_togo_widgets.dart';
import 'player_name.dart';
import 'player_remainder.dart';

import 'package:logging/logging.dart';
final Logger log = Logger("player_section_widget");

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
                  // Expanded(flex: 3, child: PlayerStatsSection(player: player)),
                  Expanded(flex: 1, child: PlayerScoredSection(player: player)),
                  // Expanded(flex: 1, child: PlayerToGoSection(player: player)),
                ],
              )
            : Row(
                children: [
                  Expanded(flex: 1, child: PlayerScoredSection(player: player)),
                  // Expanded(flex: 1, child: PlayerToGoSection(player: player)),
                  // Expanded(flex: 3, child: PlayerStatsSection(player: player)),
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
    log.fine("Displaying ${player.name} section");
    return Container(
      padding: EdgeInsets.all(8.0),

      child: Column(
        children: [
          PlayerName(name: player.name, isPlayerA: player.iD),

          player.iD
              ? // Display the order of the columns depending on the player
                Expanded( child: Row(
                  children: [
                    // Player A layout
                    Expanded(flex: 3, child: PlayerStatsSection(player: player)),


                    // Expanded(flex: 2, child: 
                      // SingleChildScrollView(scrollDirection: Axis.vertical, child: 
                        // Row(children: [
                          // PlayerScoredSection(player: player),
                          // PlayerToGoSection(player: player),
                          // Expanded(flex: 1, child: PlayerScoredSection(player: player)),
                          // Expanded(flex: 1, child: PlayerToGoSection(player: player)),
                        // ],),
                      // )
                    // ),

                    // Expanded(child: Column(children: [
                      Expanded(flex: 1, child: PlayerScoredSection(player: player)),
                      Expanded(flex: 1, child: PlayerToGoSection(player: player)),
                    // ],))
                    // SingleChildScrollView( child: Column(children: [
                    // ])),
                  ]))

              : Expanded(child: Row(
                  children: [
                    // Player B layout
                    // Column(children: [
                      Expanded(flex: 1, child: PlayerScoredSection(player: player)),
                      Expanded(flex: 1, child: PlayerToGoSection(player: player)),
                    // ]),

                    Expanded(flex: 3, child: PlayerStatsSection(player: player)),
                  ]),),

          PlayerRemainder(player: player),
        ],
      ),
    );
  }
}
