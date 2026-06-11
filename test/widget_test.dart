import 'package:flutter_test/flutter_test.dart';
import 'package:register_app/main.dart';

void main() {
  testWidgets('Register Screen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify the register title appears
    expect(find.text('Register'), findsOneWidget);

    // Verify form fields are present
    expect(find.byType(TextFormField), findsWidgets);

    // Verify Sign Up button exists
    expect(find.text('Sign Up'), findsOneWidget);

    // Verify login section text
    expect(find.text('Already have an account? '), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);

    // Verify social login buttons
    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.text('Continue with Apple'), findsOneWidget);
  });

  testWidgets('Form validation - empty fields', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap Sign Up button without filling any fields
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Verify error messages appear
    expect(find.text('Mobile number is required'), findsOneWidget);
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
    expect(find.text('Confirm password is required'), findsOneWidget);
  });

  testWidgets('Password visibility toggle works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Find password field
    final passwordField = find
        .byType(TextFormField)
        .at(2); // Third TextFormField is password

    // By default password should be obscured
    expect(find.byIcon(Icons.visibility_off), findsWidgets);

    // Tap visibility icon to show password
    await tester.tap(find.byIcon(Icons.visibility_off).first);
    await tester.pumpAndSettle();

    // Verify visibility icon changed
    expect(find.byIcon(Icons.visibility), findsWidgets);
  });

  testWidgets('Form submission with filled fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Fill all fields
    await tester.enterText(find.byType(TextFormField).at(0), '1712345678');
    await tester.enterText(find.byType(TextFormField).at(1), 'test@gmail.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'password123');
    await tester.enterText(find.byType(TextFormField).at(3), 'password123');

    await tester.pumpAndSettle();

    // Tap Sign Up button
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Verify success message appears
    expect(
      find.text('Registration form submitted successfully!'),
      findsOneWidget,
    );
  });
}
