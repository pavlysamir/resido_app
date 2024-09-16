import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:resido_app/core/Assets/assets.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/core/utils/widgets/custom_footer_button.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:shimmer/shimmer.dart';

class CompoundDetailsScreen extends StatefulWidget {
  const CompoundDetailsScreen({super.key, required this.compoundId});

  final int compoundId;

  @override
  State<CompoundDetailsScreen> createState() => _CompoundDetailsScreenState();
}

class _CompoundDetailsScreenState extends State<CompoundDetailsScreen> {
  @override
  void initState() {
    HomeCubit.get(context)!.getCompoundDetails(widget.compoundId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var compoundDetails = HomeCubit.get(context)!.compoundDetailsModel;
        var modelsCompound = HomeCubit.get(context)!.modelDetails;
        return Scaffold(
          appBar: CustomAppBar(
              title: '',
              function: () {
                // Navigate to previous screen
                Navigator.pop(context);
              }),
          body: state is GetCompoundDetailsLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: compoundDetails?.image ?? '',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: SizedBox(
                                    width: 300.w,
                                  )),
                            )),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          compoundDetails?.name ?? '',
                          style: Theme.of(context).textTheme.displayMedium!,
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.startPrice,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          '${compoundDetails?.priceTo} EGP',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.zone,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              compoundDetails?.zone.name ?? '',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.models,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SizedBox(
                              height: 43.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: modelsCompound?.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: AppColors.white,
                                    shape: ShapeBorder.lerp(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        5),
                                    elevation: 3,
                                    shadowColor: AppColors.grey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          'a1',
                                          // compoundDetails
                                          //         ?.modelCompound[index].name ??
                                          //     '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.aboutThisCompound,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          compoundDetails?.description ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.photoGallary,
                          style: Theme.of(context).textTheme.displayMedium!,
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        SizedBox(
                          height: 90.h,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 10.w,
                              );
                            },
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 90.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          AssetsData.banner,
                                        ),
                                        fit: BoxFit.cover,
                                      )));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.location,
                          style: Theme.of(context).textTheme.displayMedium!,
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text('Abu Dhabi, Khalifa City, Khalifa City A',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.availableApartments,
                          style: Theme.of(context).textTheme.displayMedium,
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
