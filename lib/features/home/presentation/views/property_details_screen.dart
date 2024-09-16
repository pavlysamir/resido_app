import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:resido_app/core/utils/widgets/custom_footer_button.dart';
import 'package:resido_app/core/utils/widgets/custom_sell_container.dart';
import 'package:resido_app/features/home/data/models/expanded_icons_text_model.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/nearest_item_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyDetailes extends StatefulWidget {
  const PropertyDetailes({super.key, required this.featureProperty});

  final FeatureProperty featureProperty;

  @override
  State<PropertyDetailes> createState() => _PropertyDetailesState();
}

class _PropertyDetailesState extends State<PropertyDetailes> {
  HomeCubit? homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit.get(context);
    homeCubit!.getApartmentDetails(widget.featureProperty.id);
  }

  @override
  Widget build(BuildContext context) {
    List<ExpandedIconsWithTextModel> widgetExpanded = [
      ExpandedIconsWithTextModel(
          iconOne: Icons.area_chart,
          name: 'Area',
          num: widget.featureProperty.area),
      ExpandedIconsWithTextModel(
          iconOne: Icons.balcony_sharp,
          name: 'Balcony',
          num: widget.featureProperty.balconies),
      ExpandedIconsWithTextModel(
          iconOne: Icons.bathroom,
          name: 'Bathrooms',
          num: widget.featureProperty.bathrooms),
      ExpandedIconsWithTextModel(
          iconOne: Icons.bed_outlined,
          name: 'Bedrooms',
          num: widget.featureProperty.masterBedroom),
    ];

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
              title: '',
              function: () {
                Navigator.of(context).pop();
              }),
          body: state is GetApartmentDetailsLoading
              ? const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                height: 213.h,
                                imageUrl: widget.featureProperty.image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Theme.of(context).cardColor,
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: AppColors.primaryColor,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            CustomSellContainer(
                              text: widget.featureProperty.type.name,
                            ),
                            Positioned(
                              bottom: 10,
                              right: 30,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Theme.of(context).cardColor,
                                child: const Icon(
                                  Icons.recycling,
                                  color: AppColors.primaryColor,
                                  size: 15,
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
                                Icons.business,
                                color: AppColors.primaryColor,
                                size: 25,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                widget.featureProperty.address ?? '',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              Container(
                                height: 24.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: AppColors.primaryColor),
                                child: Center(
                                  child: Text(
                                    widget.featureProperty.type.name,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(widget.featureProperty.name ?? '',
                            style: Theme.of(context).textTheme.labelMedium),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          '${widget.featureProperty.priceFrom} EGP',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        // NearestWidget(
                        //   iconOne: Icons.area_chart,
                        //   iconTwo: Icons.balcony,
                        //   num1: widget.featureProperty.area,
                        //   num2: widget.featureProperty.balconies,
                        //   name1: 'Area',
                        //   name2: 'Balconies',
                        // ),
                        // NearestWidget(
                        //   iconOne: Icons.bathroom,
                        //   iconTwo: Icons.bedroom_child,
                        //   num1: widget.featureProperty.bathrooms,
                        //   num2: widget.featureProperty.bedrooms,
                        //   name1: 'Bathrooms',
                        //   name2: 'Bedrooms',
                        // ),
                        CustomGridViewAdditionApartment(
                          list: widgetExpanded,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        const Divider(),
                        Text(
                          AppLocalizations.of(context)!.paymentPlay,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          height: 120.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomPaymentItem(
                                payment: widget.featureProperty.payments[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 16.w,
                              );
                            },
                            itemCount: widget.featureProperty.payments.length,
                          ),
                        ),

                        SizedBox(
                          height: 16.h,
                        ),

                        const Divider(),
                        Text(
                          AppLocalizations.of(context)!.aboutThisCompound,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Brand New, About 550 Sqft Loft/ Bachelor With Simple Kitchen, Upgrade Glass Shower, Modern And',
                            maxLines: 7,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.outdoorFacility,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
            ),
          ),
        );
      },
    );
  }
}

class CustomPaymentItem extends StatelessWidget {
  const CustomPaymentItem({
    super.key,
    required this.payment,
  });

  final Payment payment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 200, 203, 206),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            payment.start,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: AppColors.primaryColor),
          ),
          Text(
            'Monthly',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            payment.priceOfMonth,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            payment.year,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primaryColor),
          ),
          Text(
            'Down Payment',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
