import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension ObjectExtension on dynamic {
  void get printDLog => {if (kDebugMode) log(this, time: DateTime.now())};
  void get printELog =>
      {if (kDebugMode) log(this, time: DateTime.now(), level: 1)};
}

extension WidgetsExtension on Widget {
  InkWell onTap(final void Function() onTap) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: this,
    );
  }

  ElevatedButton elevatedButton({
    final void Function()? onPressed,
    final bool enable = true,
    final double? radius,
    final double? height,
    final Color? backgroundColor,
    final BorderSide side = BorderSide.none,
  }) {
    final bgColor = backgroundColor ?? const Color(0xFF959E5E);
    return ElevatedButton(
      onPressed: () {
        if (enable) {
          onPressed?.call();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: enable ? bgColor : bgColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            side: side, borderRadius: BorderRadius.circular(radius ?? 8)),
        maximumSize: Size(double.infinity, (height ?? 40)),
        minimumSize: Size(double.infinity, (height ?? 40)),
      ),
      child: this,
    );
  }

  TextButton textButton({
    final void Function()? onPressed,
    final bool enable = true,
    final double? radius,
    final double? height,
    final double? width,
    final Color? backgroundColor,
    final BorderSide side = BorderSide.none,
  }) {
    final bgColor = backgroundColor ?? const Color(0xFF959E5E);
    return TextButton(
      onPressed: () {
        if (enable) {
          onPressed?.call();
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: enable ? bgColor : bgColor.withOpacity(0.5),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            side: side, borderRadius: BorderRadius.circular(radius ?? 8)),
        maximumSize: Size(width ?? double.infinity, (height ?? 48)),
        minimumSize: Size(width ?? double.infinity, (height ?? 48)),
      ),
      child: this,
    );
  }

  Container marginOnly({
    final double left = 0.0,
    final double right = 0.0,
    final double top = 0.0,
    final double bottom = 0.0,
  }) {
    return Container(
      margin:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Container marginAll(final double value) {
    return Container(
      margin: EdgeInsets.all(value),
      child: this,
    );
  }

  Container marginSymmetric({
    final double vertical = 0.0,
    final double horizontal = 0.0,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Container paddingAll(final double value) {
    return Container(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Container paddingOnly({
    final double left = 0.0,
    final double right = 0.0,
    final double top = 0.0,
    final double bottom = 0.0,
  }) {
    return Container(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Container paddingSymmetric({
    final double vertical = 0.0,
    final double horizontal = 0.0,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }
}

extension NumExtension on num {
  Gap get sized => Gap(toDouble());
}
