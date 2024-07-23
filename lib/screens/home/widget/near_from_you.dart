import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mevivu/routers/app_router.dart';
import 'package:mevivu/utils/extensions/string_extension.dart';
import 'package:mevivu/utils/extensions/widget_extension.dart';

import '../../../utils/utils.dart';
import '../model/house.dart';

class NearFromYou extends StatelessWidget {
  const NearFromYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: 'Near from you'.size16.w500.color('000000')),
            10.sized,
            'See more'.size12
          ],
        ),
        24.sized,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: listHouse
                .map((e) => Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 24),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          width: 222,
                          height: 272,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(e.image.png))),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 24),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          width: 222,
                          height: 272,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black.withOpacity(0.24)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('pin'.svg),
                                        4.sized,
                                        e.km.size12.color('ffffff')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              e.name.size16.w500.color('ffffff'),
                              8.sized,
                              e.andress.size12.color('ffffff')
                            ],
                          ),
                        ),
                      ],
                    ).onTap(() => Utils.appRouter.push(DetailRoute(detail: e))))
                .toList(),
          ),
        ),
      ],
    );
  }
}

final listHouse = [
  HouseModel(
    name: 'Dreamsville House',
    andress: 'Jl. Sultan Iskandar Muda',
    description:
        'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
    km: '1.8 km',
    image: 'house1',
    price: 2500000000,
    bedroom: 6,
    bathroom: 4,
  ),
  HouseModel(
    name: 'Ascot House',
    andress: 'Jl. Cilandak Tengah',
    description:
        'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
    km: '3.0 km',
    image: 'house2',
    price: 2000000000,
    bedroom: 6,
    bathroom: 4,
  ),
];
