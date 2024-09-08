import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_banner_home.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_smooth_indicaror.dart';
import 'package:shimmer/shimmer.dart';

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
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        final bannerList = HomeCubit.get(context)!.bannerList;
        if (bannerList.isEmpty) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.white,
            ),
          );
        }
        return Column(
          children: [
            state is GetBannerLoading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Colors.white,
                    ),
                  )
                : CarouselSlider(
                    items: bannerList
                        .map(
                          (e) => CustomBannerHome(
                            imageUrl: e.image,
                          ),
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
            CustomSmoothIndicator(
                activeIndex: activeIndex, count: bannerList.length),
          ],
        );
      },
    );
  }
}
