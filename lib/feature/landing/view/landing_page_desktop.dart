import 'package:bumbii/app/cubit/app_cubit.dart';
import 'package:bumbii/router/router.dart';
import 'package:bumbii/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:bumbii/generated/l10n.dart';

class LandingPageDesktop extends StatelessWidget {
  const LandingPageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppCubit appCubit = context.watch<AppCubit>();
    return Scaffold(
      backgroundColor: appThemes[appCubit.state.appTheme]?.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(appCubit.state.appTheme.toString(),
                style: appThemes[appCubit.state.appTheme]
                    ?.textTheme
                    .headline1
                    ?.copyWith(color: Colors.white)),
            Text('${S.current.hello} Desktop',
                style: appThemes[appCubit.state.appTheme]
                    ?.textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white)),
            ElevatedButton(
                onPressed: _onSettingsButtonPressed,
                child: Text(S.of(context).settings))
          ],
        ),
      ),
    );
  }

  void _onSettingsButtonPressed() {
    goTo(path: RoutePath.settings);
  }
}
