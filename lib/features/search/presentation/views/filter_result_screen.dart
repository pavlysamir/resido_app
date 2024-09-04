import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:resido_app/features/search/presentation/widgets/search_item_widget.dart';

class FilterResultScreen extends StatelessWidget {
  const FilterResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is FilterSuccess) {
          return customJustGoNavigate(
              context: context, path: AppRouter.kFilterResultsScreen);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context)!.filterResults,
              function: () {
                Navigator.pop(context);
              },
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  state is FilterLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ))
                      : SearchCubit.get(context)!.searchList!.data.isEmpty
                          ? const Center(child: Text('No Data Found'))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: SearchCubit.get(context)!
                                  .filterList!
                                  .data
                                  .length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SearchItemWidget(
                                  propertyDetailsModel:
                                      SearchCubit.get(context)!
                                          .filterList!
                                          .data[index],
                                ),
                              ),
                            ),
                ],
              ),
            ));
      },
    );
  }
}
