import 'package:bumbii/enum/env.dart';
import 'package:logger/logger.dart';

const Env activeEnv = Env.dev;

Level get loggerLevel => activeEnv != Env.prod ? Level.debug : Level.nothing;

bool get prodEnv => activeEnv == Env.prod;

class EnvFilePath {
  EnvFilePath._();

  static const String dev = 'lib/env/.dev_env';
  static const String staging = 'lib/env/.staging_env';
  static const String prod = 'lib/env/.env';
}

String getConfigEnvFile({Env activeEnv = activeEnv}) {
  switch (activeEnv) {
    case Env.dev:
      return EnvFilePath.dev;
    case Env.staging:
      return EnvFilePath.staging;
    case Env.prod:
      return EnvFilePath.prod;
    default:
      return EnvFilePath.dev;
  }
}
