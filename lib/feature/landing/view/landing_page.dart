import 'package:bumbii/feature/landing/view/landing_page_desktop.dart';
import 'package:bumbii/feature/landing/view/landing_page_mobile.dart';
import 'package:bumbii/feature/landing/view/landing_page_tablet.dart';
import 'package:bumbii/widget/responsive/responsive_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsivePage(
        desktopPage: LandingPageDesktop(),
        tabletPage: LandingPageTablet(),
        mobilePage: LandingPageMobile());
  }
}
