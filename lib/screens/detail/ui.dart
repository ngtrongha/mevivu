import 'package:auto_route/annotations.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mevivu/screens/home/model/house.dart';
import 'package:mevivu/utils/extensions/string_extension.dart';
import 'package:mevivu/utils/extensions/widget_extension.dart';

import '../../utils/utils.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.detail});
  final HouseModel detail;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(detail.image.png))),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      '#000000'.toColor.withOpacity(0.8),
                                    ]),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                              width: 34,
                                              height: 34,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black
                                                      .withOpacity(0.24)),
                                              child: const Icon(
                                                Icons
                                                    .arrow_back_ios_new_rounded,
                                                color: Colors.white,
                                                size: 15,
                                              ))
                                          .onTap(
                                              () => Utils.appRouter.maybePop()),
                                      const Spacer(),
                                      Container(
                                              width: 34,
                                              height: 34,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black
                                                      .withOpacity(0.24)),
                                              child: Center(
                                                  child: SvgPicture.asset(
                                                      'bookmark'.svg)))
                                          .onTap(
                                              () => Utils.appRouter.maybePop()),
                                    ],
                                  ),
                                  const Spacer(),
                                  detail.name.size16.w500.color('ffffff'),
                                  8.sized,
                                  detail.andress.size12.color('#D4D4D4'),
                                  20.sized,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white
                                                  .withOpacity(0.2)),
                                          child: SvgPicture.asset(
                                            'bedroom'.svg,
                                            colorFilter: const ColorFilter.mode(
                                                Colors.white, BlendMode.srcIn),
                                          )),
                                      8.sized,
                                      '${detail.bedroom} Bedroom'
                                          .size12
                                          .color('ffffff'),
                                      20.sized,
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white
                                                  .withOpacity(0.2)),
                                          child: SvgPicture.asset(
                                            'bathroom'.svg,
                                            colorFilter: const ColorFilter.mode(
                                                Colors.white, BlendMode.srcIn),
                                          )),
                                      8.sized,
                                      '${detail.bathroom} Bathroom'
                                          .size12
                                          .color('ffffff'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    20.sized,
                    'Description'.size16.w500.color('000000'),
                    20.sized,
                    ExpandableText(
                      detail.description,
                      expandText: 'show more',
                      collapseText: 'show less',
                      maxLines: 1,
                      linkColor: Colors.blue,
                    ),
                    24.sized,
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: '#C4C4C4'.toColor,
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  fit: BoxFit.cover,
                                  image: AssetImage('avatar'.png))),
                        ),
                        16.sized,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'Garry Allen'.size16.w500.color('000000'),
                            4.sized,
                            'Owner'.size12
                          ],
                        )),
                        16.sized,
                        Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: '#0A8ED9'.toColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SvgPicture.asset('phone'.svg),
                        ),
                        16.sized,
                        Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: '#0A8ED9'.toColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SvgPicture.asset('message'.svg),
                        ),
                      ],
                    ),
                    32.sized,
                    'Gallery'.size16.w500.color('000000'),
                    20.sized,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [1, 2, 3, 4].map((e) {
                          if (e == 4) {
                            return Container(
                              width: 72,
                              height: 72,
                              margin: const EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('room$e'.png))),
                              child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: '+5'.size20.w500.color('ffffff')),
                            );
                          }
                          return Container(
                            width: 72,
                            height: 72,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('room$e'.png))),
                          );
                        }).toList(),
                      ),
                    ),
                    34.sized,
                    Container(
                      width: double.infinity,
                      height: 161,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage('map'.png))),
                    ),
                  ],
                ),
              ),
            )),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 161, bottom: 20),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.transparent,
                    Colors.white,
                  ])),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Price'.size12,
                      8.sized,
                      '${Utils.moneyFormat(detail.price)} / Year'
                          .size16
                          .w500
                          .color('000000'),
                    ],
                  )),
                  Container(
                    width: 122,
                    height: 43,
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
                      child: 'Rent Now'.size16.w600.color('ffffff'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
