import 'package:flutter/material.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:resido_app/features/favourite/presentation/widgets/favorites_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: AppLocalizations.of(context)!.favoutires, function: () {}),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: FavoritesWidget(),
        ),
      ),
    );
  }
}
