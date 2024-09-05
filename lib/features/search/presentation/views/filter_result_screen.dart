import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:resido_app/features/search/presentation/widgets/search_item_widget.dart';

class FilterResultScreen extends StatefulWidget {
  const FilterResultScreen({super.key});

  @override
  State<FilterResultScreen> createState() => _FilterResultScreenState();
}

class _FilterResultScreenState extends State<FilterResultScreen> {
  ScrollController? _scrollController;
  bool isLoading = false;
  int pageNum = 1;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // HomeCubit.get(context)!
    //     .getAllUsers(pageNumber: pageNum); // Fetch initial data
    _scrollController!.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    //_searchCubit.clearData();

    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController!.position.pixels >=
            0.7 * _scrollController!.position.maxScrollExtent &&
        !isLoading) {
      if (SearchCubit.get(context)!.countFilter! !=
          SearchCubit.get(context)!.filterList!.data.length) {
        isLoading = true;
        if (kDebugMode) {
          print("bavlyyyyyyyyyyyyyy${++pageNum}");
        }
        await SearchCubit.get(context)!.filter(pageNum++);
        isLoading = false;
      } else {
        null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBar(
              title: AppLocalizations.of(context)!.filterResults,
              function: () {
                Navigator.pop(context);
              },
            ),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  state is FilterLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ))
                      : SearchCubit.get(context)!.filterList == null
                          ? const Center(child: Text('No Data Found'))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
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
