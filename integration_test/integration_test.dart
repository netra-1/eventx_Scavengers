import 'package:eventxandroid/screens/auth/forgot_password.dart';
import 'package:eventxandroid/screens/auth/login.dart';
import 'package:eventxandroid/screens/auth/reset_password.dart';
import 'package:eventxandroid/screens/bottom_nav_bar.dart';
import 'package:eventxandroid/screens/event_booking/choose_venue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Choosing Venue Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ChooseVenueScreen(),
        ),
      );
      Finder noOfPeople = find.byKey(const ValueKey('txtNoOfPeople'));
      await tester.enterText(noOfPeople, '300');
      Finder venueDate = find.byKey(const ValueKey('txtdate'));
      await tester.enterText(venueDate, '2022-12-06');
      Finder btnNext = find.byKey(const ValueKey('btnNext'));
      await tester.dragUntilVisible(
        btnNext, // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );
      await tester.tap(btnNext);
      await tester.pumpAndSettle();
      expect(find.byType(SafeArea), findsOneWidget);
    },
  );

  testWidgets('Login Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/bottom_navbar': (context) => const BottomNavBar(index: 0),
        },
        home: const LoginScreen(),
      ),
    );
    Finder txtEmail = find.byKey(const ValueKey('txtEmail'));
    await tester.enterText(txtEmail, 'xyz@gmail.com');
    Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
    await tester.enterText(txtPassword, '#Sishir123');
    Finder btnLogin = find.byKey(const ValueKey('btnLogin'));
    await tester.tap(btnLogin);
    await tester.pumpAndSettle();
    expect(find.text("Login as: "), findsOneWidget);
  });

  testWidgets('Forgot Password Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/resetPassword': (context) => const ResetPasswordScreen(),
        },
        home: const ForgotPasswordScreen(),
      ),
    );
    Finder txtEmail = find.byKey(const ValueKey('txtEmail'));
    await tester.enterText(txtEmail, 'xyz@gmail.com');
    Finder btnLogin = find.byKey(const ValueKey('btnReset'));
    await tester.tap(btnLogin);
    await tester.pumpAndSettle();
    expect(find.text("Password"), findsOneWidget);
  });
}
