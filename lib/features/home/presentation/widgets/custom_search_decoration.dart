import 'package:flutter/material.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/features/search/presentation/views/search_screen.dart';
import '../../../../../../core/utils/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchDecoration extends StatelessWidget {
  const CustomSearchDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ),
        );
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.search, color: AppColors.primaryColor),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)!.search,
                style:
                    Styles.textStyle18Black.copyWith(color: Colors.grey[600]),
              ),
            ],
          )),
    );
  }
}
