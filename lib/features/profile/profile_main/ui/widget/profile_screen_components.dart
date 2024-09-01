import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/Assets/assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_go_navigator.dart';
import '../../logic/profile_cubit.dart';
import 'account_dialog_widget.dart';
import 'delete_account_dialog.dart';



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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DeleteAccountDialog();
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


