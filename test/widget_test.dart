import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_profile_card_app/main.dart';

void main() {
  testWidgets('Student Profile Card App loading and render test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the screen title is present
    expect(find.text('Student Profile'), findsOneWidget);

    // Verify that the shimmer loading placeholder is shown first
    expect(find.byKey(const ValueKey("shimmer_key")), findsOneWidget);
    expect(find.byKey(const ValueKey("profile_card_key")), findsNothing);

    // Advance time by 2.5 seconds to trigger the delayed load completion
    await tester.pump(const Duration(milliseconds: 2500));
    // Settle transitions for the AnimatedSwitcher
    await tester.pumpAndSettle();

    // Verify that the shimmer is gone and the profile card is successfully rendered
    expect(find.byKey(const ValueKey("shimmer_key")), findsNothing);
    expect(find.byKey(const ValueKey("profile_card_key")), findsOneWidget);

    // Check for student profile details
    expect(find.text('BULBUL AHMED'), findsOneWidget);
    expect(find.text('ID: STU-2026-001'), findsOneWidget);
    expect(find.text('Computer Science & Engineering'), findsOneWidget);
  });
}
