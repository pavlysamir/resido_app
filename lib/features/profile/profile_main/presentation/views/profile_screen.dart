import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/core/Assets/assets.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_go_navigator.dart';
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
    return BlocProvider(
      // Provide the ProfileCubit to manage the state of the profile screen
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // Listen to state changes and perform actions if needed
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const HeaderWidget(), // Build the header section
                  const SizedBox(height: 20.0),
                  const ProfileInfoWidget(), // Build the profile info section
                  const SizedBox(height: 20.0),
                  ItemsList(items: items), // Build the list of items
                  const SizedBox(height: 0.0),
                  LogoutButton(onPressed: () {
                    // Add your logout logic here
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AccountDialogWidget(
                          title: 'Logout Confirmation',
                          imagePath: AssetsData.logOutConfirmation,
                          message: 'Are you sure you want to logout?',
                          actions: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add horizontal margin
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(10.0), // Set border radius
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Color(0xFF087C7C)), // Set text color
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add horizontal margin
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF087C7C),
                                    borderRadius: BorderRadius.circular(10.0), // Set border radius
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      // Add your delete logic here
                                    },
                                    child: const Text('Delete', style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }), // Build the logout button
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
