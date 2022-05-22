import 'package:bumbii/app/cubit/app_cubit.dart';
import 'package:bumbii/enum/app_theme.dart';
import 'package:bumbii/widget/responsive/responsive_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

class SettingsPageRobot {
  final WidgetTester tester;

  SettingsPageRobot(this.tester);

  void verify5Buttons() {
    expect(find.byType(ElevatedButton), findsNWidgets(5));
  }

  Future<void> verifyTapOnEnableDarkThem() async {
    final Finder enableDarkThemeButtonFinder = find.text('Enable Dark Theme');

    expect(enableDarkThemeButtonFinder, findsOneWidget);

    await tester.tap(enableDarkThemeButtonFinder);

    final BuildContext context = tester.element(find.byType(ResponsivePage));
    final AppCubit appCubit = context.read<AppCubit>();
    expect(appCubit.state.appTheme, AppTheme.dark);
  }
}