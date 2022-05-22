import 'package:bumbii/app/cubit/app_cubit.dart';
import 'package:bumbii/enum/app_languages.dart';
import 'package:bumbii/enum/app_theme.dart';
import 'package:bumbii/generated/l10n.dart';
import 'package:bumbii/theme/app_themes.dart';
import 'package:bumbii/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SettingsPageTablet extends StatelessWidget {
  const SettingsPageTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppCubit appCubit = context.watch<AppCubit>();
    final ThemeData? themeData = appThemes[appCubit.state.appTheme];
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: animationDuration),
        color: themeData?.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${S.of(context).settings} Tablet',
                  style: themeData?.textTheme.headline1),
              ElevatedButton(
                  onPressed: () =>
                      _onChangeThemePressed(appCubit, AppTheme.dark),
                  child: const Text('Enable Dark Theme')),
              ElevatedButton(
                  onPressed: () =>
                      _onChangeThemePressed(appCubit, AppTheme.light),
                  child: const Text('Enable Light Theme')),
              ElevatedButton(
                  onPressed: () =>
                      _onChangeThemePressed(appCubit, AppTheme.kids),
                  child: const Text('Enable Kids Theme')),
              ElevatedButton(
                  onPressed: () =>
                      _onChangeLanguagePressed(appCubit, AppLanguage.en),
                  child: const Text('English')),
              ElevatedButton(
                  onPressed: () =>
                      _onChangeLanguagePressed(appCubit, AppLanguage.vi),
                  child: const Text('Tiếng Việt')),
            ],
          ),
        ),
      ),
    );
  }

  void _onChangeThemePressed(AppCubit appCubit, AppTheme newTheme) {
    appCubit.changeTheme(theme: newTheme);
  }

  void _onChangeLanguagePressed(AppCubit appCubit, AppLanguage appLanguage) {
    appCubit.changeLanguage(language: appLanguage);
  }
}
