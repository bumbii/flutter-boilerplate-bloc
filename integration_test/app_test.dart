import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bumbii/main.dart' as app;

import 'robots/landing_page_robot.dart';
import 'robots/settings_page_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  LandingPageRobot landingPageRobot;
  SettingsPageRobot settingsPageRobot;

  testWidgets('Test the whole app', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    landingPageRobot = LandingPageRobot(tester);
    settingsPageRobot = SettingsPageRobot(tester);

    // await tester.pump(const Duration(milliseconds: 4000));
    // await tester.pumpAndSettle();

    // Test Landing page
    landingPageRobot.verifyAppThemeText();
    landingPageRobot.verifyHelloText();
    landingPageRobot.verifySettingsButton();
    await landingPageRobot.verifyTapOnSettingsButton();

    // Test Settings page
    await tester.pumpAndSettle();
    settingsPageRobot.verify5Buttons();
    await settingsPageRobot.verifyTapOnEnableDarkThem();
  });
}