import 'package:flutter/material.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/styles.dart';

import '../data/models/onBoeding_model.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({super.key, required this.model});
  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('${model.image}'),
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
          ),
          Column(children: [
            Text('${model.title}',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColors.primaryColor),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text(
                '${model.messege}',
                style: Styles.textStyle16Black,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ])
        ],
      ),
    );
  }
}
