import 'package:bumbii/feature/settings/view/settings_page_desktop.dart';
import 'package:bumbii/feature/settings/view/settings_page_mobile.dart';
import 'package:bumbii/feature/settings/view/settings_page_tablet.dart';
import 'package:bumbii/widget/responsive/responsive_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsivePage(
        desktopPage: SettingsPageDesktop(),
        tabletPage: SettingsPageTablet(),
        mobilePage: SettingsPageMobile());
  }
}
