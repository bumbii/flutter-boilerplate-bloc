import 'package:bumbii/enum/env.dart';
import 'package:bumbii/env/env.dart';
import 'package:test/test.dart';

void main() {
  group('Test env', () {
    test('Default env should be dev', () {
      expect(getConfigEnvFile(), EnvFilePath.dev);
    });

    test('Get dev env', () {
      expect(getConfigEnvFile(activeEnv: Env.dev), EnvFilePath.dev);
    });

    test('Get staging env', () {
      expect(getConfigEnvFile(activeEnv: Env.staging), EnvFilePath.staging);
    });

    test('Get prod env', () {
      expect(getConfigEnvFile(activeEnv: Env.prod), EnvFilePath.prod);
    });
  });
}
