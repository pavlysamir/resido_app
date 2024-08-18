import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/core/Assets/assets.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_go_navigator.dart';
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
  Map<String, VoidCallback> getActionsMap(BuildContext context) {
    return {
      // 'My Enquiry': () => Navigator.pushNamed(context, '/myEnquiry'),
      // 'My Advertisements': () => Navigator.pushNamed(context, '/myAdvertisements'),
      // 'Subscription': () => Navigator.pushNamed(context, '/subscription'),
      // 'Transaction History': () => Navigator.pushNamed(context, '/transactionHistory'),
      // 'Language': () => Navigator.pushNamed(context, '/language'),
      // 'Dark Theme': () {
      //   // Add your dark theme toggle logic here
      // },
      // 'Notifications': () => Navigator.pushNamed(context, '/notifications'),
      // 'Articles': () => Navigator.pushNamed(context, '/articles'),
      // 'Area Converter': () => Navigator.pushNamed(context, '/areaConverter'),
      // 'Share this App': () {
      //   // Add your share logic here
      // },
      'Rate us': () {},
      'Contact us': () {
        customJustGoNavigate(context: context, path: AppRouter.kAboutUs);
      },
      'About us': () {},
      // 'Terms & Conditions': () => Navigator.pushNamed(context, '/termsAndConditions'),
      // 'Privacy Policy': () => Navigator.pushNamed(context, '/privacyPolicy'),
      'Delete Account': () {
        // Add your delete account logic here
        showAccountDialog(
          title: 'Delete Account?',
          imagePath: AssetsData.deleteAccountAlertDialog,
          message:
              "You won't able to rollback it. You will be logged out and all active sessions will be terminated",
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 4.0), // Add horizontal margin
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius:
                        BorderRadius.circular(10.0), // Set border radius
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(color: Color(0xFF087C7C)), // Set text color
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 4.0), // Add horizontal margin
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF087C7C),
                    borderRadius:
                        BorderRadius.circular(10.0), // Set border radius
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Add your delete logic here
                    },
                    child: const Text('Delete',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
          context: context,
        );
      },
    };
  }

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
                  _buildHeader(context), // Build the header section
                  const SizedBox(height: 20.0),
                  _buildProfileInfo(context), // Build the profile info section
                  const SizedBox(height: 20.0),
                  _buildItemsList(), // Build the list of items
                  const SizedBox(height: 0.0),
                  buildLogoutButton(onPressed: () {
                    // Add your logout logic here
                    showAccountDialog(
                        title: 'Logout Confirmation',
                        imagePath: AssetsData.logOutConfirmation,
                        message: 'Are you sure you want to logout?',
                        actions: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0), // Add horizontal margin
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set border radius
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Color(
                                            0xFF087C7C)), // Set text color
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0), // Add horizontal margin
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF087C7C),
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set border radius
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    // Add your delete logic here
                                  },
                                  child: const Text('Delete',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ),
                        ],
                        context: context);
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

  // Build the header section of the profile screen
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: 16.0, bottom: 15.0),
      child: const Text(
        'My Profile',
        style: TextStyle(
          color: Color(0xFF4D5454),
          fontSize: 18.0,
        ),
      ),
    );
  }

  // Build the profile info section with user details
  Widget _buildProfileInfo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the profile edit screen when tapped
        customJustGoNavigate(
            context: context, path: AppRouter.kProfileEditScreen);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/mainLogo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Icon(
                Icons.navigate_next_rounded,
                color: Colors.blue,
                size: 40.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Build the list of items in the profile screen
  Widget _buildItemsList() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Add your logic here
              final action = getActionsMap(context)[items[index]['title']];
              if (action != null) {
                action();
              }
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          items[index]['asset']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        items[index]['title']!,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF4D5454),
                        ),
                      ),
                      const Spacer(),
                      items[index]['title'] == 'Dark Theme'
                          ? Image.asset(
                              'assets/images/toggle.png',
                              fit: BoxFit.cover,
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.grey,
                                size: 30.0,
                              ),
                            ),
                    ],
                  ),
                ),
                if (items[index]['title'] != 'Delete Account') const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }

  // Logout button widget with icon and text label
  Widget buildLogoutButton({required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF087C7C),
          borderRadius:
              BorderRadius.circular(10.0), // Optional: Add border radius
        ),
        child: TextButton.icon(
          onPressed: onPressed,
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0), // Add border radius
            ),
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              AssetsData.logout, // Replace with the correct image path
              color: const Color(
                  0xFF087C7C), // Optional: Set image color to white if needed
              width: 24.0, // Optional: Set width
              height: 24.0, // Optional: Set height
            ),
          ),
          label: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
      ),
    );
  }

  void showAccountDialog({
    required BuildContext context,
    required String title,
    required String message,
    required String imagePath,
    required List<Widget> actions,
  }) {
    final screenSize = MediaQuery.of(context).size;
    final imageWidth = screenSize.width * 0.25; // 25% of screen width
    final imageHeight = screenSize.height * 0.35; // 25% of screen height

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath, // Replace with the correct image path
                width: 400,
                height: 250,
              ),
              const SizedBox(height: 16.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF087C7C), // Set text color
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF4D5454), // Set text color
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: actions,
              )
            ],
          ),
        );
      },
    );
  }
}
