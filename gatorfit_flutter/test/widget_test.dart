// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gatorfit_flutter/main.dart';

void main() {
  testWidgets('Button navigation smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FigmaToCodeApp());

    // Verify that we start on the diet page
    expect(find.text('Calories'), true);

    // Tap the Home icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    // Verify that we are now on the home page
    expect(find.text('Today\'s Workout'), true);
  });
}
