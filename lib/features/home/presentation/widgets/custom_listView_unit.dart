import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/Assets/assets.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:resido_app/core/utils/widgets/custom_sell_container.dart';

class CustomUnitListview extends StatelessWidget {
  const CustomUnitListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 20,
            );
          },
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                customJustGoNavigate(
                    context: context, path: AppRouter.kPropertyDetails);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: Alignment.bottomRight, children: [
                    Image.asset(
                      AssetsData.unitItem,
                      width: 250.w,
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).cardColor,
                      child: const Icon(
                        Icons.favorite_outline,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const CustomSellContainer(
                      text: 'Sell',
                    ),
                  ]),
                  Container(
                    width: 250.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3.r),
                          bottomRight: Radius.circular(3.r)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.business,
                                size: 18,
                              ),
                              Text(
                                'city',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          Text(
                            '2,500,000',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          Text('Luxuries Haven Villa',
                              style: Theme.of(context).textTheme.labelMedium),
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                ),
                              ),
                              Expanded(
                                flex: 9,
                                child: Text(
                                  '123 Palm Avenue, Dubai, United Arab',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
