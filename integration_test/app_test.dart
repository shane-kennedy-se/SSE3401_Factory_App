import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lab_5_2/dashboard.dart';
import 'package:lab_5_2/engineer_list.dart';
import 'package:lab_5_2/gauge.dart';
import 'package:lab_5_2/invitation.dart';
import 'package:lab_5_2/main.dart';
import 'package:lab_5_2/otp_verification.dart';
import 'package:lab_5_2/registration_page.dart';
import 'package:lab_5_2/settings.dart'; // replace with your actual package name

void main() {

  testWidgets('Navigation Bar Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Find the BottomNavigationBar.
    final bottomNavBar = find.byType(BottomNavigationBar);
    expect(bottomNavBar, findsOneWidget);

    // Tap the first BottomNavigationBarItem (EngineerListPage).
    await tester.tap(find.descendant(of: bottomNavBar, matching: find.byIcon(Icons.person)));
    await tester.pumpAndSettle();

    // Verify that the EngineerListPage is displayed.
    expect(find.byType(EngineerListPage), findsOneWidget);

    // Tap the second BottomNavigationBarItem (Dashboard).
    await tester.tap(find.descendant(of: bottomNavBar, matching: find.byIcon(Icons.home_outlined)));
    await tester.pumpAndSettle();

    // Verify that the Dashboard is displayed.
    expect(find.byType(Dashboard), findsOneWidget);

    // Tap the third BottomNavigationBarItem (Settings).
    await tester.tap(find.descendant(of: bottomNavBar, matching: find.byIcon(Icons.settings)));
    await tester.pumpAndSettle();

    // Verify that the Settings page is displayed.
    expect(find.byType(Settings), findsOneWidget);
  });

  testWidgets('Dashboard Page ElevatedButton test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    await tester.tap(find.descendant(of: find.byType(BottomNavigationBar), matching: find.byIcon(Icons.home_outlined)));
    await tester.pumpAndSettle();

    // Verify that there are ElevatedButtons.
    expect(find.byType(ElevatedButton), findsWidgets);

    // Tap the first ElevatedButton.
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    // Verify that the title has changed to 'Factory 1'.
    expect(find.byKey(Key('dashboardTitle')), findsOneWidget);
    expect((find.byKey(Key('dashboardTitle')).evaluate().single.widget as Text).data, 'Factory 1');

    // Tap the second ElevatedButton.
    await tester.tap(find.byType(ElevatedButton).at(1));
    await tester.pumpAndSettle();

    // Verify that the title has changed to 'Factory 2'.
    expect(find.byKey(Key('dashboardTitle')), findsOneWidget);
    expect((find.byKey(Key('dashboardTitle')).evaluate().single.widget as Text).data, 'Factory 2');
  });

  testWidgets('Dashboard Page Gauge test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Dashboard()));

    // Verify that there are Gauge widgets.
    expect(find.byType(Gauge), findsWidgets);
  });

  testWidgets('Settings Page navigation and interaction test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    await tester.tap(find.descendant(of: find.byType(BottomNavigationBar), matching: find.byIcon(Icons.settings)));
    await tester.pumpAndSettle();

    // Find the TextFields and enter text.
    var textFields = find.byType(TextField);
    expect(textFields, findsWidgets);

    await tester.enterText(textFields.first, '1');
    await tester.enterText(textFields.at(1), '2');
    await tester.pumpAndSettle();

    // Find the ElevatedButtons and tap them.
    var buttons = find.byType(ElevatedButton);
    expect(buttons, findsWidgets);

    await tester.tap(buttons.first);
    await tester.pumpAndSettle();
  });

  testWidgets('Engineer List Page Test', (WidgetTester tester) async {
    //Build app and launch frame
    await tester.pumpWidget(MyApp());

    // Tap the first BottomNavigationBarItem (EngineerListPage).
    await tester.tap(find.descendant(of: find.byType(BottomNavigationBar), matching: find.byIcon(Icons.person)));
    await tester.pumpAndSettle();

    // Verify that the EngineerListPage is displayed.
    expect(find.byType(EngineerListPage), findsOneWidget);

    // Verify that there are ElevatedButtons.
    expect(find.byType(ElevatedButton), findsWidgets);

    // Tap the first ElevatedButton.
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    // Verify that the title has changed to 'Factory 1'.
    expect(find.byKey(Key('topTitle')), findsOneWidget);
    expect((tester.widget(find.byKey(Key('topTitle'))) as Text).data, 'Factory 1');

    // Tap the second ElevatedButton.
    await tester.tap(find.byType(ElevatedButton).at(1));
    await tester.pumpAndSettle();

    // Verify that the title has changed to 'Factory 2'.
    expect(find.byKey(Key('topTitle')), findsOneWidget);
    expect((tester.widget(find.byKey(Key('topTitle'))) as Text).data, 'Factory 2');

    // Tap the FloatingActionButton.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify that the InvitationPage is displayed.
    expect(find.byType(InvitationPage), findsOneWidget);

    // Find the TextField for the phone number and enter a number.
    var phoneNumberField = find.byType(TextField).last;
    expect(phoneNumberField, findsOneWidget);

    await tester.enterText(phoneNumberField, '1234567890');
    await tester.pumpAndSettle();

    // Find the ElevatedButton and tap it.
    var submitButton = find.byType(ElevatedButton);
    expect(submitButton, findsOneWidget);

    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    // Verify that the EngineerListPage is displayed.
    expect(find.byType(EngineerListPage), findsOneWidget);

    // Verify that the EngineerListPage is displayed.
    expect(find.byType(EngineerListPage), findsOneWidget);

    // Tap the settings icon.
    await tester.tap(find.byKey(Key('registrationPageIcon')));
    await tester.pumpAndSettle();

    // Verify that the RegistrationPage is displayed.
    expect(find.byType(RegistrationPage), findsOneWidget);

    // Find the TextField for the phone number and enter a number.
    var phoneNumberField2 = find.byType(TextField).last;
    expect(phoneNumberField2, findsOneWidget);

    await tester.enterText(phoneNumberField2, '1234567890');
    await tester.pumpAndSettle();

    // Find the CheckboxListTile and tap it.
    var checkbox = find.byType(CheckboxListTile);
    expect(checkbox, findsOneWidget);

    await tester.tap(checkbox);
    await tester.pumpAndSettle();

    // Find the "Get Activation Code" button and tap it.
    var getActivationCodeButton = find.text('Get Activation Code');
    expect(getActivationCodeButton, findsOneWidget);

    await tester.tap(getActivationCodeButton);
    await tester.pumpAndSettle();

    // Verify that the OTPVerificationPage is displayed.
    expect(find.byType(OTPVerificationPage), findsOneWidget);

    // Find the TextField for the OTP and enter a number.
    var otpField = find.byType(TextField).last;
    expect(otpField, findsOneWidget);

    await tester.enterText(otpField, '123456');
    await tester.pumpAndSettle();

    // Find the "Activate" button and tap it.
    var activateButton = find.text('Activate');
    expect(activateButton, findsOneWidget);

    await tester.tap(activateButton);
    await tester.pumpAndSettle();

    // Verify that the Dashboard is displayed.
    expect(find.byType(Dashboard), findsOneWidget);
  });
}