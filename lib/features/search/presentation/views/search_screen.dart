import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/widgets/custom_button_large.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:resido_app/features/search/presentation/widgets/Custom_Search_Bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          customJustGoNavigate(
              context: context, path: AppRouter.kSearchResultScreen);
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: state is SearchLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButtonLarge(
                    text: AppLocalizations.of(context)!.search,
                    function: () {
                      SearchCubit.get(context)!.search(1);
                    },
                    textColor: Colors.white,
                  ),
                ),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 130.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColors.primaryColor,
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: SizedBox(
                                height: 50.h,
                                child: const CustomSearchBar(),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  customJustGoNavigate(
                                      context: context,
                                      path: AppRouter.kFilterScreen);
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 44.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 2,
                                        style: BorderStyle.solid,
                                        strokeAlign:
                                            BorderSide.strokeAlignInside),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).cardColor,
                                  ),
                                  child: Icon(
                                    Icons.filter_list_rounded,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: ListView.separated(
                //     separatorBuilder: (context, index) {
                //       return const Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 12),
                //         child: Divider(),
                //       );
                //     },
                //     padding: EdgeInsets.zero,
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: 3,
                //     itemBuilder: (context, index) {
                //       return Row(
                //         children: [
                //           InkWell(
                //             onTap: () {},
                //             child: const Icon(
                //               Icons.replay_outlined,
                //               color: Colors.grey,
                //               size: 20,
                //             ),
                //           ),
                //           SizedBox(
                //             width: 10.w,
                //           ),
                //           Text('Modern villa in Villas',
                //               style: Theme.of(context).textTheme.headlineMedium)
                //         ],
                //       );
                //     },
                //   ),
                // ),
                // state is SearchLoading
                //     ? const Center(
                //         child: CircularProgressIndicator(
                //         color: AppColors.primaryColor,
                //       ))
                //     : SearchCubit.get(context)!.searchList == null
                //         ? const Center(child: Text('No Data Found'))
                //         : ListView.builder(
                //             scrollDirection: Axis.vertical,
                //             shrinkWrap: true,
                //             itemCount: SearchCubit.get(context)!
                //                 .searchList!
                //                 .data
                //                 .length,
                //             itemBuilder: (context, index) => Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: SearchItemWidget(
                //                 propertyDetailsModel: SearchCubit.get(context)!
                //                     .searchList!
                //                     .data[index],
                //               ),
                //             ),
                //           ),
              ],
            ),
          ),
        );
      },
    );
  }
}
