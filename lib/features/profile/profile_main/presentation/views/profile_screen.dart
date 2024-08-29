import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/core/Assets/assets.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences_cash_helper.dart';
import '../../../../../core/utils/widgets/custom_go_navigator.dart';
import '../components/account_dialog_widget.dart';
import '../components/logout_widget.dart';
import '../components/profile_info_widget.dart';
import '../components/profile_screen_components.dart';
import '../controller/profile_bloc_cubit.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // List of items to be displayed in the profile screen
  final List<Map<String, dynamic>> items = [
    {'title': 'My Enquiry', 'asset': AssetsData.myEnquiry},
    {'title': 'My Advertisements', 'asset': AssetsData.myAdvertisement},
    {'title': 'Subscription', 'asset': AssetsData.subscription},
    {'title': 'Transaction History', 'asset': AssetsData.transaction},
    {'title': 'Language', 'asset': AssetsData.language},
    {'title': 'Dark Theme', 'asset': AssetsData.mode},
    {'title': 'Notifications', 'asset': AssetsData.notification},
    {'title': 'Articles', 'asset': AssetsData.articles},
    {'title': 'Area Converter', 'asset': AssetsData.areaConverter},
    {'title': 'Share this App', 'asset': AssetsData.share},
    {'title': 'Rate us', 'asset': AssetsData.rate},
    {'title': 'Contact us', 'asset': AssetsData.contactUs},
    {'title': 'About us', 'asset': AssetsData.aboutUs},
    {'title': 'Terms & Conditions', 'asset': AssetsData.termsAndConditions},
    {'title': 'Privacy Policy', 'asset': AssetsData.privacyPolicy},
    {
      'title': 'Delete Account',
      'asset': AssetsData.deleteAccount,
      'function': () {}
    },
  ];

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
                  background: HeaderWidget(),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    const ProfileInfoWidget(), // Build the profile info section
                    const SizedBox(height: 20.0),
                    ItemsList(items: items), // Build the list of items
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
