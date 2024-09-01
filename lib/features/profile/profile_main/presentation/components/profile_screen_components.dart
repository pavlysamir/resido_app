import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resido_app/features/profile/profile_main/ui/widget/account_dialog_widget.dart';

import '../../../../../core/Assets/assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_go_navigator.dart';

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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AccountDialogWidget(
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
                        style: TextStyle(
                            color: Color(0xFF087C7C)), // Set text color
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
          );
        },
      );
    },
  };
}

class CustomInkWell extends StatelessWidget {
  final BuildContext context;
  final int index;
  final List<Map<String, dynamic>> items;

  const CustomInkWell({
    Key? key,
    required this.context,
    required this.index,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}

class ItemsList extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const ItemsList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          return CustomInkWell(context: context, index: index, items: items);
        },
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.11,
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
}
