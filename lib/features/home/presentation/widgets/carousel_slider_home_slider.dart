import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_banner_home.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_smooth_indicaror.dart';

import '../../../../../core/assets/Assets.dart';

class CustomCarouselSliderHome extends StatefulWidget {
  const CustomCarouselSliderHome({super.key});

  @override
  State<CustomCarouselSliderHome> createState() =>
      _CustomCarouselSliderHomeState();
}

class _CustomCarouselSliderHomeState extends State<CustomCarouselSliderHome> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      AssetsData.banner,
      AssetsData.banner,
      AssetsData.banner,
    ];

    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map(
                (e) => const CustomBannerHome(),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            height: MediaQuery.of(context).size.height * 0.2,
            initialPage: 0,
            scrollPhysics: const BouncingScrollPhysics(),
            enableInfiniteScroll: false,
            reverse: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 1,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            enlargeCenterPage: true,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomSmoothIndicator(activeIndex: activeIndex, count: imgList.length),
      ],
    );
  }
}
