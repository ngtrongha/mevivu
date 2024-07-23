import 'package:auto_route/annotations.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mevivu/screens/home/widget/menu.dart';
import 'package:mevivu/utils/extensions/string_extension.dart';
import 'package:mevivu/utils/extensions/widget_extension.dart';

import 'widget/best_for_you.dart';
import 'widget/near_from_you.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        drawerEdgeDragWidth: 150,
        drawer: const HomeMenu(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.sized,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'Location'.size12.color('#838383'),
                          Row(
                            children: [
                              'Jakarta'.size20.w500.color('#000000'),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: '#838383'.toColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    10.sized,
                    Badge(
                        badgeStyle:
                            const BadgeStyle(padding: EdgeInsets.all(4)),
                        position: BadgePosition.topEnd(top: -2, end: -2),
                        child: SvgPicture.asset('bell'.svg))
                  ],
                ),
                22.sized,
                Row(
                  children: [
                    Expanded(
                        child: Material(
                      color: '#F7F7F7'.toColor,
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Center(
                              child: SvgPicture.asset(
                            'search'.svg,
                            width: 16,
                            height: 16,
                          )),
                          prefixIconConstraints:
                              const BoxConstraints(maxWidth: 52),
                          hintText: 'Search address, or near you',
                          border: InputBorder.none,
                        ),
                      ),
                    )),
                    8.sized,
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                '#A0DAFB'.toColor,
                                '#0A8ED9'.toColor,
                              ])),
                      child: Center(
                        child: SvgPicture.asset(
                          'setting'.svg,
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                18.sized,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: listCategory.map((e) {
                      if (e == listCategory.first) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    '#A0DAFB'.toColor,
                                    '#0A8ED9'.toColor,
                                  ]),
                              borderRadius: BorderRadius.circular(10)),
                          child: e.size12.w500.color('#ffffff'),
                        );
                      }
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                            color: '#F7F7F7'.toColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: e.size12.color('#858585'),
                      );
                    }).toList(),
                  ),
                ),
                27.sized,
                const NearFromYou(),
                32.sized,
                const BestForYou()
              ],
            ),
          ),
        )),
      ),
    );
  }
}

final listCategory = [
  'House',
  'Apartment',
  'Hotel',
  'Villa',
  'Cottage',
];
