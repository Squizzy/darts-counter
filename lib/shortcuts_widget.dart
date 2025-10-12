import 'package:flutter/material.dart';

class ShortcutButtons extends StatelessWidget {
  const ShortcutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Shortcuts")],
      ),
    );
  }
}
