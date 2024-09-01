import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/header_widget.dart';
import '../../logic/profile_cubit.dart';
import '../widget/logout_widget.dart';
import '../widget/profile_info_widget.dart';
import '../widget/profile_screen_components.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // Listen to state changes and perform actions if needed
      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                //   backgroundColor: Colors.transparent,
                pinned: true,
                //  expandedHeight: MediaQuery.of(context).size.height * 0.12,
                flexibleSpace: FlexibleSpaceBar(
                  // title: Text('My Profile'),
                  background: HeaderWidget(
                    showArrow: false,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    const ProfileInfoWidget(), // Build the profile info section
                    const SizedBox(height: 20.0),
                    ItemsList(items: cubit.items), // Build the list of items
                    const SizedBox(height: 0.0),
                    LogoutButton(onPressed: () {
                      // Add your logout logic here
                      LogoutDialog.show(context);
                    }), // Build the logout button
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
