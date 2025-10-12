import 'package:flutter/material.dart';

class PlayerRemainder extends StatelessWidget {
  const PlayerRemainder({super.key, required this.remainder});

  final int remainder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(0.0),
      child: DecoratedBox (
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.inverseSurface,
        ),
      
        child: Text(
          "$remainder",
          style: TextStyle(fontSize: 40, color: theme.colorScheme.surface),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
