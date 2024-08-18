import 'package:flutter/material.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/utils/app_colors.dart';

class GridViewPropertiesItem extends StatelessWidget {
  const GridViewPropertiesItem(
      {super.key,
      required this.item,
      required this.function,
      required this.index});

  final String item;
  final int index;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
          color: selecties['selected'] == true && selecties['index'] == index
              ? AppColors.primaryColor
              : AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.house_outlined,
                  color: selecties['selected'] == true &&
                          selecties['index'] == index
                      ? AppColors.white
                      : AppColors.primaryColor),
              Text(
                'House',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )),
    );
  }
}
