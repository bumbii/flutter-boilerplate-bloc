import 'package:bumbii/app/cubit/app_cubit.dart';
import 'package:bumbii/app/cubit/app_state.dart';
import 'package:bumbii/enum/app_languages.dart';
import 'package:bumbii/generated/l10n.dart';
import 'package:bumbii/router/router.dart';
import 'package:bumbii/theme/app_themes.dart';
import 'package:bumbii/utils/locale_utitls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
            // Hide keyboard
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (ctx, state) {
              final Locale locale = getAppLocale(
                  appLanguage: state.appLanguage ?? AppLanguage.en);
              return MaterialApp.router(
                useInheritedMediaQuery: true,
                debugShowCheckedModeBanner: false,
                theme: appThemes[state],
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: locale,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                },
                routerDelegate: router.routerDelegate,
                routeInformationParser: router.routeInformationParser,
                routeInformationProvider: router.routeInformationProvider,
              );
            },
          ),
        ));
  }
}
