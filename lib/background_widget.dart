import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {

    return
    // Image(image: AssetImage("assets/dart_background.jpg"), fit: BoxFit.cover);
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/dart_background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );

  }
}
