import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/profile_edit_screen_components.dart';
import '../controller/profile_edit_cubit.dart';

class ProfileEditeScreen extends StatelessWidget {
  ProfileEditeScreen({super.key});

  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        // listen of state
      },
      builder: (context, state) {
        var cubit = ProfileEditCubit.get(context);

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
    );
  }

}