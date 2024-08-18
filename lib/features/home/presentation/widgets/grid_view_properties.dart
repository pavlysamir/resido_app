import 'package:flutter/material.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/features/home/presentation/widgets/grid_view_properties_item.dart';

class GridViewProperties extends StatefulWidget {
  const GridViewProperties({super.key});

  @override
  State<GridViewProperties> createState() => _GridViewPropertiesState();
}

class _GridViewPropertiesState extends State<GridViewProperties> {
  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List<String>.generate(9, (index) => "Item $index");
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 5 / 4,
        // 4 items per row
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return GridViewPropertiesItem(
          item: items[index],
          function: () {
            setState(() {
              selecties.clear();
              selecties.addAll({'selected': !isSelected, 'index': index});
            });
          },
          index: index,
        );
      },
    );
  }
}
