import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';

import '../../../../../../core/utils/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool isFocused = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: 60.h,
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: formKey,
              child: TextFormField(

                controller: searchCubit.searchController,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onTap: () {
                  setState(() {
                    isFocused = true;
                  });
                },
                onFieldSubmitted: (String _) {
                  if (formKey.currentState!.validate()) {}
                },
                onChanged: (String _) {
                  searchCubit. emitSearchItems(
                    searchCubit.searchController.text,
                  );
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                  filled: true,
                  fillColor: Theme.of(context).bottomAppBarTheme.color,
                  enabledBorder: outlineInputBorder(context),
                  focusedBorder: outlineInputBorder(context),
                  hintText: AppLocalizations.of(context)!.searchByName,
                  hintStyle: Styles.textStyle14Blck.copyWith(
                    color: Colors.grey,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

InputBorder? outlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderSide:
        BorderSide(color: Colors.grey[300]!), // Border color changes to red
    borderRadius: BorderRadius.circular(8),
  );
}

OutlineInputBorder outlineInputBorderError() {
  return OutlineInputBorder(
    borderSide:
        const BorderSide(color: Colors.red), // Border color changes to red
    borderRadius: BorderRadius.circular(5),
  );
}
