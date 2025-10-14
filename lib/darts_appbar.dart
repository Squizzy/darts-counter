import 'package:flutter/material.dart';

// class DartsAppBar extends StatelessWidget {
//   const DartsAppBar({super.key, required this.title});

//   // final Color backgroundColor;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     final AppBar appBar;
//     final theme = Theme.of(context);

//     return AppBar(
//       backgroundColor: theme.colorScheme.inversePrimary,
//       // backgroundColor: Colors.transparent,
//       title: Text(title),
//     );
//   }
// }
class DartsAppBar extends StatelessWidget implements PreferredSizeWidget {
  DartsAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // backgroundColor: Colors.transparent,
      title: Text(title),
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(30.0);
}
