import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Assets/assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../components/profile_edit_screen_components.dart';
import '../controller/profile_edite_cubit.dart';

class ProfileEditeScreen extends StatelessWidget {
  ProfileEditeScreen({super.key});

  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileEditeCubit(),
      child: BlocConsumer<ProfileEditeCubit, ProfileEditeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProfileEditeCubit.get(context);

          return const Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderWidget(),
                  SizedBox(height: 0.0),
                  ProfileFormWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }






}