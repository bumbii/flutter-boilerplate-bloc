import 'package:bumbii/env/env.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._();
  AppLogger._() {
    Logger.level = loggerLevel;

    _logger = Logger(
      printer: PrettyPrinter()
    );
  }
  static AppLogger get instance => _instance;

  static late Logger _logger;

  void i(dynamic message) {
    _logger.i(message);
  }

  void d(dynamic message) {
    _logger.d(message);
  }

  void v(dynamic message) {
    _logger.v(message);
  }

  void w(dynamic message) {
    _logger.w(message);
  }

  void e(dynamic message) {
    _logger.e(message);
  }

  void wtf(dynamic message) {
    _logger.wtf(message);
  }
}
