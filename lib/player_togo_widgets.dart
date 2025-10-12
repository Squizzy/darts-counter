import 'package:flutter/material.dart';

class ToGoTitle extends StatelessWidget {
  const ToGoTitle({super.key, required this.toGoTitle});

  final String toGoTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.primary,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.inversePrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(20.0, 8.0),
            topRight: Radius.elliptical(20.0, 8.0),
          ),
          border: Border.all(color: theme.colorScheme.primary),
        ),

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
                toGoTitle,
                style: TextStyle(color: theme.colorScheme.primary),
                textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ToGoItem extends StatelessWidget {
  const ToGoItem({super.key, required this.toGoValue});

  final int? toGoValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onPrimaryContainer,
          width: 0.2,
        ),
        color: (toGoValue == null)
            ? theme.colorScheme.inversePrimary
            : theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),

      child: Text(
        (toGoValue == null) ? "" : toGoValue.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.colorScheme.onPrimaryContainer,
          fontSize: 20,
        ),
      ),
    );
  }
}

class PlayerToGoSection extends StatelessWidget {
  const PlayerToGoSection({super.key, required this.toGo});

  final List<int> toGo;

  @override
  Widget build(BuildContext context) {
    return ToGoTitle(toGoTitle: "To go");
  }
}

class ToGoCounter extends StatelessWidget {
  const ToGoCounter({
    super.key,
    required this.toGoUpdate,
    required this.startScore,
  });

  final List<int> toGoUpdate;
  final int startScore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      // color: theme.colorScheme.primary,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(20.0, 8.0),
          bottomRight: Radius.elliptical(20.0, 8.0),
        ),
        color: theme.colorScheme.primary,
      ),

      // color: Colors.deepOrange,
      // shadowColor: theme.colorScheme.primary,
      // surfaceTintColor: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(0.8),

        // child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        child: ListView(
          children: [for (int u in toGoUpdate) ToGoItem(toGoValue: u)],
        ),
        //   ],
        // ),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [Text(startScore.toString())],
        //   ),

        //   for (int togo in toGoUpdate)
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       mainAxisSize: MainAxisSize.min,
        //       children: [Text(togo.toString())],
        //     ),
        // ],
        // ),
      ),
    );
  }
}
