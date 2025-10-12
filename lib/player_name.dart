import 'package:flutter/material.dart';

class PlayerName extends StatelessWidget {
  const PlayerName({super.key, required this.name, required this.isPlayerA});

  final String name;
  final bool isPlayerA;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(20.0, 10.0),
          topRight: Radius.elliptical(20.0, 10.0),
        ),

        border: Border.all(color: theme.colorScheme.primary, width: 5),
        color: theme.colorScheme.primary,
        // color: Colors.transparent
      ),

      child: Padding(
        padding: const EdgeInsets.only(
          right: 20.0,
          left: 20.0,
          top: 0.0,
          bottom: 3.0,
        ),
            child: Row(
              mainAxisAlignment: isPlayerA
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
      ),
    );
  }
}
