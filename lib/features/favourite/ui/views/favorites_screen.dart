// lib/features/favourite/ui/views/favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/features/favourite/logic/cubit/favorite_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/font/dimensions.dart';
import '../../../../core/widgets/header_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../widgets/favorites_item_widget.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({
    super.key,
  });

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    // refresh the favorite list
    FavoriteCubit.get(context).getFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = FavoriteCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              HeaderWidget(
                title: AppLocalizations.of(context)!.favorites,
                showArrow: false,
              ),
              Expanded(
                  child: cubit.dataFavoriteModel != null
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: cubit.dataFavoriteModel!.data.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FavoriteItem(
                                favoriteData:
                                    cubit.dataFavoriteModel!.data[index]),
                          ),
                        )
                      :const ShimmerListView(itemCount: 10),


              ),
            ],
          ),
        );
      },
    );
  }
}
