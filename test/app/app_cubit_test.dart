import 'package:bumbii/app/cubit/app_cubit.dart';
import 'package:bumbii/app/cubit/app_state.dart';
import 'package:bumbii/enum/app_languages.dart';
import 'package:bumbii/enum/app_theme.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock/mock_storage.dart';

void main() {
  group('AppCubit - Test hydrated (fromJson/toJson)', () {
    late AppCubit appCubit;

    setUp(() async {
      appCubit = await mockHydratedStorage(AppCubit.new);
    });

    test('Default app state should be returned', () {
      expect(appCubit.fromJson({'theme': '', 'language': ''}),
          const AppState(appTheme: AppTheme.kids, appLanguage: AppLanguage.vi));
    });
  });

  group('AppCubit - Test app theme', () {
    late AppCubit appCubit;

    setUp(() async {
      appCubit = await mockHydratedStorage(AppCubit.new);
    });

    test('Default app theme is ${AppTheme.kids}', () {
      expect(appCubit.state.appTheme, AppTheme.kids);
    });

    test('Change theme to ${AppTheme.dark}', () {
      appCubit.changeTheme(theme: AppTheme.dark);
      expect(appCubit.state.appTheme, AppTheme.dark);
    });

    test('Change theme to ${AppTheme.light}', () {
      appCubit.changeTheme(theme: AppTheme.light);
      expect(appCubit.state.appTheme, AppTheme.light);
    });
  });

  group('AppCubit - Test app language', () {
    late AppCubit appCubit;

    setUp(() async {
      appCubit = await mockHydratedStorage(AppCubit.new);
    });

    test('Default app language is ${AppLanguage.vi}', () {
      expect(appCubit.state.appLanguage, AppLanguage.vi);
    });

    test('Change language to ${AppLanguage.en}', () {
      appCubit.changeLanguage(language: AppLanguage.en);
      expect(appCubit.state.appLanguage, AppLanguage.en);
    });

    test('Change language to ${AppLanguage.vi}', () {
      appCubit.changeLanguage(language: AppLanguage.vi);
      expect(appCubit.state.appLanguage, AppLanguage.vi);
    });
  });
}
