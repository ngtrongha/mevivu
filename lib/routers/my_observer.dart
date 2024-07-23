import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:mevivu/utils/extensions/widget_extension.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPop(Route route, Route? previousRoute) {}

  @override
  void didPush(Route route, Route? previousRoute) {
    'New route pushed: ${route.settings.name}'.printDLog;
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    ('Tab route visited: ${route.name}').printDLog;
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    'Tab route re-visited: ${route.name}'.printDLog;
  }
}
