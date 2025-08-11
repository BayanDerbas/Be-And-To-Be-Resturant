import 'package:flutter/material.dart';

class ResponsiveConfig extends InheritedWidget {
  final double screenWidth;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  ResponsiveConfig({
    super.key,
    required super.child,
    required BuildContext context,
  })  : screenWidth = MediaQuery.of(context).size.width,
        isMobile = MediaQuery.of(context).size.width < 600,
        isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 800,
        isDesktop = MediaQuery.of(context).size.width >= 800;
  static ResponsiveConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ResponsiveConfig>()!;
  }

  @override
  bool updateShouldNotify(ResponsiveConfig oldWidget) => screenWidth != oldWidget.screenWidth;
}
