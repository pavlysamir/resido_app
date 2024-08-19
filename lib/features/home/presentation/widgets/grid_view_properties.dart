import 'package:flutter/material.dart';
import 'package:resido_app/features/home/presentation/widgets/grid_view_properties_item.dart';

class GridViewMostLikedProperties extends StatefulWidget {
  const GridViewMostLikedProperties({super.key});

  @override
  State<GridViewMostLikedProperties> createState() =>
      _GridViewPropertiesState();
}

class _GridViewPropertiesState extends State<GridViewMostLikedProperties> {
  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List<String>.generate(4, (index) => "Item $index");
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,

        // 4 items per row
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return const GridViewPropertiesItem();
      },
    );
  }
}
