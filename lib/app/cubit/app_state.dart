import 'package:bumbii/enum/app_languages.dart';
import 'package:bumbii/enum/app_theme.dart';
import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final AppTheme? appTheme;
  final AppLanguage? appLanguage;

  const AppState({this.appTheme, this.appLanguage});

  @override
  List<Object?> get props => [appTheme, appLanguage];
}
