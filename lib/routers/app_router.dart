import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mevivu/utils/extensions/string_extension.dart';

import '../screens/detail/ui.dart';
import '../screens/home/model/house.dart';
import '../screens/home/ui.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => Platform.isIOS
      ? const RouteType.cupertino()
      : const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          path: HomeRoute.name.pathName,
        ),
        AutoRoute(
          page: DetailRoute.page,
          path: DetailRoute.name.pathName,
        ),
      ];
}
