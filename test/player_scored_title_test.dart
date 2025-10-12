import 'package:first_app/player_scored_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';


void main() {
  testWidgets('This test confirms the word scored is displayed', (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: PlayerScoredTitle(scoredTitle: "scored")));
    expect(find.text("scored"), findsOneWidget);
  });

  testWidgets('', (widgetTester) async {
    assert (0 == 0);
  });
}
