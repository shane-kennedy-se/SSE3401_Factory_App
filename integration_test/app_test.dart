import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lab_5_2/dashboard.dart';
import 'package:lab_5_2/engineer_list.dart';
import 'package:lab_5_2/gauge.dart';
import 'package:lab_5_2/invitation.dart';
import 'package:lab_5_2/main.dart';
import 'package:lab_5_2/otp_verification.dart';
import 'package:lab_5_2/registration_page.dart';
import 'package:lab_5_2/settings.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App Integration Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Find the BottomNavigationBar.
    final bottomNavBar = find.byType(BottomNavigationBar);
    expect(bottomNavBar, findsOneWidget);

    // Test EngineerListPage navigation and interactions.
    await tester.tap(find.descendant(
        of: bottomNavBar, matching: find.byIcon(Icons.person)));
    await tester.pumpAndSettle();

    expect(find.byType(EngineerListPage), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);

    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();
    expect(find.byKey(Key('topTitle')), findsOneWidget);
    expect((tester.widget(find.byKey(Key('topTitle'))) as Text).data,
        'Factory 1');

    await tester.tap(find.byType(ElevatedButton).at(1));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('topTitle')), findsOneWidget);
    expect((tester.widget(find.byKey(Key('topTitle'))) as Text).data,
        'Factory 2');

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(InvitationPage), findsOneWidget);

    var phoneNumberField = find.byType(TextField).last;
    await tester.enterText(phoneNumberField, '1234567890');
    await tester.pumpAndSettle();

    var submitButton = find.byType(ElevatedButton);
    await tester.tap(submitButton);
    await tester.pumpAndSettle();
    expect(find.byType(EngineerListPage), findsOneWidget);

    await tester.tap(find.byKey(Key('registrationPageIcon')));
    await tester.pumpAndSettle();
    expect(find.byType(RegistrationPage), findsOneWidget);

    var phoneNumberField2 = find.byType(TextField).last;
    await tester.enterText(phoneNumberField2, '1234567890');
    await tester.pumpAndSettle();

    var checkbox = find.byType(CheckboxListTile);
    await tester.tap(checkbox);
    await tester.pumpAndSettle();

    var getActivationCodeButton = find.text('Get Activation Code');
    await tester.tap(getActivationCodeButton);
    await tester.pumpAndSettle();
    expect(find.byType(OTPVerificationPage), findsOneWidget);

    var otpField = find.byType(TextField).last;
    await tester.enterText(otpField, '123456');
    await tester.pumpAndSettle();

    var activateButton = find.text('Activate');
    await tester.tap(activateButton);
    await tester.pumpAndSettle();
    expect(find.byType(Dashboard), findsOneWidget);

    // Test Dashboard navigation and interactions.
    await tester.tap(find.descendant(
        of: bottomNavBar, matching: find.byIcon(Icons.home_outlined)));
    await tester.pumpAndSettle();

    expect(find.byType(Dashboard), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);

    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();
    expect(find.byKey(Key('dashboardTitle')), findsOneWidget);
    expect((tester.widget(find.byKey(Key('dashboardTitle'))) as Text).data,
        'Factory 1');

    await tester.tap(find.byType(ElevatedButton).at(1));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('dashboardTitle')), findsOneWidget);
    expect((tester.widget(find.byKey(Key('dashboardTitle'))) as Text).data,
        'Factory 2');

    expect(find.byType(Gauge), findsWidgets);

    // Test Settings navigation and interactions.
    await tester.tap(find.descendant(
        of: bottomNavBar, matching: find.byIcon(Icons.settings)));
    await tester.pumpAndSettle();
    expect(find.byType(Settings), findsOneWidget);

    var textFields = find.byType(TextField);
    await tester.enterText(textFields.first, '1');
    await tester.enterText(textFields.at(1), '2');
    await tester.pumpAndSettle();

    var buttons = find.byType(ElevatedButton);
    await tester.tap(buttons.first);
    await tester.pumpAndSettle();
  });
}
