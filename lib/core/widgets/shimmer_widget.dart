import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/font/dimensions.dart';

class ShimmerListView extends StatelessWidget {
  final int itemCount;
  final bool isVertical;
  final bool isGrid;

  const ShimmerListView({
    super.key,
    required this.itemCount,
    this.isVertical = true,
    this.isGrid = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      return GridView.builder(
        itemCount: itemCount,
        padding: const EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isVertical ? 2 : 1,
          childAspectRatio: isVertical ? 1 : 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            color: Theme.of(context).highlightColor,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          height: 140.h,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 70,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 30,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      return ListView.builder(
        itemCount: itemCount,
        padding: const EdgeInsets.all(0),
        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            color: Theme.of(context).highlightColor,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          height: 140.h,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 70,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 30,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

class ItemShimmer extends StatefulWidget {
  const ItemShimmer({super.key});

  @override
  _ItemShimmerState createState() => _ItemShimmerState();
}

class _ItemShimmerState extends State<ItemShimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  height: 350.h,
                  width: 170.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(3.r),
                      bottomRight: Radius.circular(3.r),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              width: 18,
                              height: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              width: 100,
                              height: 18,
                              color: Colors.grey,
                            ),
                            Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          width: 100,
                          height: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          width: 150,
                          height: 18,
                          color: Colors.grey,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              width: 18,
                              height: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              width: 150,
                              height: 18,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}