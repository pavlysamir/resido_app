import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/grid_view_properties_item.dart';

class GridViewMostLikedProperties extends StatefulWidget {
  const GridViewMostLikedProperties({super.key});

  @override
<<<<<<< HEAD
  State<GridViewMostLikedProperties> createState() => _GridViewMostLikedPropertiesState();
}

class _GridViewMostLikedPropertiesState extends State<GridViewMostLikedProperties> {
=======
  State<GridViewMostLikedProperties> createState() =>
      _GridViewMostLikedPropertiesState();
}

class _GridViewMostLikedPropertiesState
    extends State<GridViewMostLikedProperties> {
>>>>>>> 69885cbef8cb623689aa1ee439535d1732147a6e
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
<<<<<<< HEAD
    HomeCubit.get(context)?.getMostLike();

  }
=======
    HomeCubit.get(context)!.getMostLike();
  }

>>>>>>> 69885cbef8cb623689aa1ee439535d1732147a6e
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    // cubit?.getMostLike();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // Handle side effects here if needed
      },
      builder: (context, state) {
        if (cubit!.mostLike != null) {
          final mostLikeList = cubit.mostLike!.data;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: mostLikeList.length,
            itemBuilder: (BuildContext context, int index) {
              return GridViewPropertiesItem(item: mostLikeList[index]);
            },
          );
        } else {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 2, // Default shimmer items count
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
