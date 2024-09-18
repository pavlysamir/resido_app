import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_form_field.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';

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
        return CustomFormField(
          controller: SearchCubit.get(context)!.searchController,
          hintText: AppLocalizations.of(context)!.search,
          textInputType: TextInputType.text,
          onChange: (p0) {
            searchCubit.search(
              1,
            );
          },
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

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Function()? function;

  const CustomSearchAppBar({
    super.key,
    this.title,
    this.showBackButton = true,
    this.actions,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 200.h,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.5), //(x,y)
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: function,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryColor,
                    )),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    height: 50.h,
                    child: const CustomSearchBar(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
