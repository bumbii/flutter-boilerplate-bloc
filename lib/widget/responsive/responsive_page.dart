import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsivePage extends StatelessWidget {
  final Widget desktopPage;
  final Widget tabletPage;
  final Widget mobilePage;
  final Widget? watchPage;

  const ResponsivePage(
      {Key? key,
      required this.desktopPage,
      required this.tabletPage,
      required this.mobilePage,
      this.watchPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (builderContext, sizingInformation) {
      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          return desktopPage;
        case DeviceScreenType.tablet:
          return tabletPage;
        case DeviceScreenType.mobile:
          return mobilePage;
        case DeviceScreenType.watch:
          return watchPage ?? mobilePage;
        default:
          return desktopPage;
      }
    });
  }
}
