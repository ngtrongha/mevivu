import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mevivu/routers/app_router.dart';
import 'package:mevivu/utils/extensions/string_extension.dart';
import 'package:mevivu/utils/extensions/widget_extension.dart';

import '../../../utils/utils.dart';
import '../model/house.dart';

class BestForYou extends StatelessWidget {
  const BestForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: 'Best for you'.size16.w500.color('000000')),
            10.sized,
            'See more'.size12
          ],
        ),
        24.sized,
        ...listHouseBest.map((e) => Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Row(
                children: [
                  Container(
                    width: 74,
                    height: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(e.image.png)),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  20.sized,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      e.name.size16.w500.color('000000'),
                      8.sized,
                      '${Utils.moneyFormat(e.price)} / Year'
                          .size12
                          .color('#0A8ED9'),
                      8.sized,
                      SingleChildScrollView(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('bedroom'.svg),
                            8.sized,
                            '${e.bedroom} Bedroom'.size12,
                            20.sized,
                            SvgPicture.asset('bathroom'.svg),
                            8.sized,
                            '${e.bathroom} Bathroom'.size12,
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ).onTap(() => Utils.appRouter.push(DetailRoute(detail: e))))
      ],
    );
  }
}

final listHouseBest = [
  HouseModel(
    name: 'Orchad House',
    andress: 'Jl. Sultan Iskandar Muda',
    description:
        'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
    km: '',
    price: 2500000000,
    bedroom: 6,
    bathroom: 4,
    image: 'house3',
  ),
  HouseModel(
    name: 'The Hollies House',
    andress: 'Jl. Sultan Iskandar Muda',
    description:
        'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
    km: '',
    price: 2000000000,
    bedroom: 5,
    bathroom: 2,
    image: 'house4',
  ),
];
