import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mevivu/utils/extensions/string_extension.dart';
import 'package:mevivu/utils/extensions/widget_extension.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264,
      height: MediaQuery.of(context).size.height,
      color: '0a8ed9'.toColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            130.sized,
            Container(
              height: 40,
              width: 165,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.sized,
                  SvgPicture.asset(
                    'home'.svg,
                    colorFilter:
                        ColorFilter.mode('0A8ED9'.toColor, BlendMode.srcIn),
                  ),
                  16.sized,
                  'Home'.size16.w500.color('#0A8ED9'),
                  const Spacer()
                ],
              ),
            ),
            32.sized,
            Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                  color: '0A8ED9'.toColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.sized,
                  SvgPicture.asset(
                    'profile'.svg,
                    colorFilter:
                        ColorFilter.mode('ffffff'.toColor, BlendMode.srcIn),
                  ),
                  16.sized,
                  'Profile'.size16.w500.color('ffffff'),
                  const Spacer()
                ],
              ),
            ),
            32.sized,
            Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                  color: '0A8ED9'.toColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.sized,
                  SvgPicture.asset(
                    'nearby'.svg,
                    colorFilter:
                        ColorFilter.mode('ffffff'.toColor, BlendMode.srcIn),
                  ),
                  16.sized,
                  'Nearby'.size16.w500.color('ffffff'),
                  const Spacer()
                ],
              ),
            ),
            32.sized,
            Container(
              height: 1,
              width: 165,
              color: Colors.white.withOpacity(0.5),
            ),
            32.sized,
            Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                  color: '0A8ED9'.toColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.sized,
                  SvgPicture.asset(
                    'bookmark'.svg,
                    colorFilter:
                        ColorFilter.mode('ffffff'.toColor, BlendMode.srcIn),
                  ),
                  16.sized,
                  'Bookmark'.size16.w500.color('ffffff'),
                  const Spacer()
                ],
              ),
            ),
            32.sized,
            Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                  color: '0A8ED9'.toColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.sized,
                  Badge(
                    badgeStyle: const BadgeStyle(padding: EdgeInsets.all(4)),
                    position: BadgePosition.topEnd(top: -2, end: -2),
                    child: SvgPicture.asset(
                      'bell'.svg,
                      width: 14,
                      height: 18,
                      colorFilter:
                          ColorFilter.mode('ffffff'.toColor, BlendMode.srcIn),
                    ),
                  ),
                  16.sized,
                  'Notification'.size16.w500.color('ffffff'),
                  const Spacer()
                ],
              ),
            ),
            32.sized,
            Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                  color: '0A8ED9'.toColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.sized,
                  Badge(
                    badgeStyle: const BadgeStyle(padding: EdgeInsets.all(4)),
                    position: BadgePosition.topEnd(top: -2, end: -2),
                    child: SvgPicture.asset(
                      'message2'.svg,
                      colorFilter:
                          ColorFilter.mode('ffffff'.toColor, BlendMode.srcIn),
                    ),
                  ),
                  16.sized,
                  'Message'.size16.w500.color('ffffff'),
                  const Spacer()
                ],
              ),
            ),
            32.sized,
            Container(
              height: 1,
              width: 165,
              color: Colors.white.withOpacity(0.5),
            ),
            32.sized,
            Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                  color: '0A8ED9'.toColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.sized,
                  SvgPicture.asset(
                    'setting2'.svg,
                    colorFilter:
                        ColorFilter.mode('ffffff'.toColor, BlendMode.srcIn),
                  ),
                  16.sized,
                  'Setting'.size16.w500.color('ffffff'),
                  const Spacer()
                ],
              ),
            ),
            32.sized,
            Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                  color: '0A8ED9'.toColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.sized,
                  SvgPicture.asset(
                    'help'.svg,
                    colorFilter:
                        ColorFilter.mode('ffffff'.toColor, BlendMode.srcIn),
                  ),
                  16.sized,
                  'Help'.size16.w500.color('ffffff'),
                  const Spacer()
                ],
              ),
            ),
            32.sized,
            Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                  color: '0A8ED9'.toColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.sized,
                  SvgPicture.asset(
                    'logout'.svg,
                    colorFilter:
                        ColorFilter.mode('ffffff'.toColor, BlendMode.srcIn),
                  ),
                  16.sized,
                  'Logout'.size16.w500.color('ffffff'),
                  const Spacer()
                ],
              ),
            ),
            32.sized,
          ],
        ),
      ),
    );
  }
}

final listMenu = [
  'Home',
  'Profile',
  'Nearby',
  'Bookmark',
  'Notification',
  'Message',
  'Setting',
  'Profile',
  'Profile',
];
