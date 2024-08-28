import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_listView_all_feature_prop.dart';

class FeaturePropScreen extends StatefulWidget {
  const FeaturePropScreen({super.key});

  @override
  State<FeaturePropScreen> createState() => _FeaturePropScreenState();
}

class _FeaturePropScreenState extends State<FeaturePropScreen> {
  @override
  void initState() {
    // TODO: implement initState
    HomeCubit.get(context)!.getAllFeatureProparties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.featureProb,
        function: () {
          Navigator.pop(context);
        },
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetAllFeaturePropertiesLoading
              ? const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomListviewAllFeatureProp(
                        allFeatureProperties:
                            HomeCubit.get(context)!.allFeatureProperties,
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
