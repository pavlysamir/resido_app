import 'package:flutter/widgets.dart';
import 'package:resido_app/features/home/data/models/features_model.dart';
import 'package:resido_app/features/home/presentation/widgets/all_feature_prop_item_widget.dart';

class CustomListviewAllFeatureProp extends StatelessWidget {
  const CustomListviewAllFeatureProp(
      {super.key, required this.allFeatureProperties});

  final List<FeatureProperty> allFeatureProperties;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allFeatureProperties.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: AllFeaturePropItemWidget(
          featureProperty: allFeatureProperties[index],
        ),
      ),
    );
  }
}
