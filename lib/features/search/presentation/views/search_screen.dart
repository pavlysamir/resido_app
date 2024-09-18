import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:resido_app/features/search/presentation/widgets/Custom_Search_Bar.dart';
import 'package:resido_app/features/search/presentation/widgets/search_item_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    context.read<SearchCubit>().searchList?.data?.clear();
    context.read<SearchCubit>().searchController.clear();
    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController!.position.pixels >=
            0.7 * _scrollController!.position.maxScrollExtent &&
        !isLoading) {
      if (SearchCubit.get(context)!.count! !=
          SearchCubit.get(context)!.searchList!.data?.length) {
        isLoading = true;
        if (kDebugMode) {
          print("bavlyyyyyyyyyyyyyy${++pageNum}");
        }
        await SearchCubit.get(context)!.search(pageNum++);
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
          appBar: CustomSearchAppBar(
            function: () {
              context.read<SearchCubit>().searchList?.data?.clear();
              context.read<SearchCubit>().searchController.clear();
              Navigator.pop(context);
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (SearchCubit.get(context)?.searchList?.data != null)
                  ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        context.read<SearchCubit>().searchList?.data?.length,
                    itemBuilder: (context, index) {
                      final item =
                          context.read<SearchCubit>().searchList?.data?[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchItemWidget(
                          propertyDetailsModel: item,
                        ),
                      );
                    },
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
