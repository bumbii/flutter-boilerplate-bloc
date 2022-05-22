import 'package:bumbii/app/cubit/app_cubit.dart';
import 'package:bumbii/widget/responsive/responsive_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bumbii/generated/l10n.dart';

class LandingPageRobot {
  final WidgetTester tester;

  LandingPageRobot(this.tester);

  void verifyAppThemeText() {
    final BuildContext context = tester.element(find.byType(ResponsivePage));
    final AppCubit appCubit = context.read<AppCubit>();
    expect(find.text(appCubit.state.appTheme.toString()), findsOneWidget);
  }

  void verifyHelloText() {
    final BuildContext context = tester.element(find.byType(ResponsivePage));
    expect(find.textContaining(S.of(context).hello), findsOneWidget);
  }

  void verifySettingsButton() {
    expect(find.byType(ElevatedButton), findsOneWidget);
  }

  Future<void> verifyTapOnSettingsButton() async {
    final Finder settingsButtonFinder = find.byType(ElevatedButton);

    expect(settingsButtonFinder, findsOneWidget);

    await tester.tap(settingsButtonFinder);
  }
}