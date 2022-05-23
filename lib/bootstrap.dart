import 'dart:async';
import 'dart:io';

import 'package:bumbii/app/app_observer.dart';
import 'package:bumbii/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    AppLogger.instance.e(details.exceptionAsString());
  };

  late Directory appDocDirectory;
  if (!kIsWeb) {
    appDocDirectory = await getApplicationDocumentsDirectory();
  }
  final storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : Directory('${appDocDirectory.path}/bumbii'));
  await runZonedGuarded(
        () async {
      await HydratedBlocOverrides.runZoned(() async => runApp(await builder()),
          blocObserver: AppBlocObserver(), storage: storage);
    },
        (error, stackTrace) => AppLogger.instance.e(error.toString()),
  );
}
