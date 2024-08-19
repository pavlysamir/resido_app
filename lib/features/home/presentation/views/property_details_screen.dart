import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:resido_app/core/utils/widgets/custom_footer_button.dart';
import 'package:resido_app/core/utils/widgets/custom_sell_container.dart';
import 'package:resido_app/features/home/presentation/widgets/nearest_item_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class PropertyDetailes extends StatelessWidget {
  const PropertyDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: '',
          function: () {
            Navigator.of(context).pop();
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 250.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: NetworkImage(
                            'https://www.arabcont.com/Images/ProjectImage/nwab3.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 30,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Theme.of(context).cardColor,
                        child: const Icon(
                          Icons.favorite_border,
                          color: AppColors.primaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const CustomSellContainer(
                    text: 'Sell',
                  ),
                  Positioned(
                    bottom: 10,
                    right: 30,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: Theme.of(context).cardColor,
                      child: const Icon(
                        Icons.recycling,
                        color: AppColors.primaryColor,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.home_outlined,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text(
                      'House',
                      style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Container(
                      height: 24.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: AppColors.primaryColor),
                      child: const Center(
                        child: Text(
                          'Sell',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Text('Luxuries Haven Villa',
                      style: Theme.of(context).textTheme.labelMedium),
                  const Spacer(),
                  const Text(
                    ' 3 months ago',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.grey, fontSize: 12),
                  ),
                ],
              ),
              const Text(
                ' \$2500,000',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontSize: 18),
              ),

              // TO DO
              // GridView.builder(
              //   gridDelegate: gridDelegate,
              //   itemBuilder: (BuildContext context, int index) {  },),
              const NearestWidget(),
              const NearestWidget(),
              const NearestWidget(),

              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ' About This Property',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Brand New, About 550 Sqft Loft/ Bachelor With Simple Kitchen, Upgrade Glass Shower, Modern And',
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.grey, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        CustomFooterButton(
          function: () {},
          text: 'SMS',
          borderColor: AppColors.primaryColor,
          icon: Icons.chat,
        ),
        CustomFooterButton(
          function: () {},
          text: 'Chat',
          borderColor: AppColors.primaryColor,
          icon: IconlyLight.chat,
        ),
        CustomFooterButton(
          function: () {},
          text: 'Call',
          borderColor: AppColors.primaryColor,
          icon: Icons.phone,
        ),
      ],
    );
  }
}
