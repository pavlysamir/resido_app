import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Assets/assets.dart';
import '../../../../../core/widgets/header_widget.dart';
import '../../logic/profile_cubit.dart';
import '../widget/logout_widget.dart';
import '../widget/profile_info_widget.dart';
import '../widget/profile_screen_components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of items to be displayed in the profile screen
    final List<Map<String, dynamic>> items = [
      {'title': AppLocalizations.of(context)!.myEnquiry, 'asset': AssetsData.myEnquiry},

      {'title': AppLocalizations.of(context)!.myAds, 'asset': AssetsData.myAdvertisement},
      {'title': AppLocalizations.of(context)!.subscription, 'asset': AssetsData.subscription},
      {'title': AppLocalizations.of(context)!.transactionHistory, 'asset': AssetsData.transaction},
      {'title': AppLocalizations.of(context)!.language, 'asset': AssetsData.language},
      {'title': AppLocalizations.of(context)!.darkTheme, 'asset': AssetsData.mode},
      {'title': AppLocalizations.of(context)!.notification, 'asset': AssetsData.notification},
      {'title': AppLocalizations.of(context)!.articles, 'asset': AssetsData.articles},
      {'title': AppLocalizations.of(context)!.areaConverter, 'asset': AssetsData.areaConverter},
      {'title': AppLocalizations.of(context)!.shareThisApp, 'asset': AssetsData.share},
      {'title': AppLocalizations.of(context)!.rateUs, 'asset': AssetsData.rate},
      {'title': AppLocalizations.of(context)!.contactUs, 'asset': AssetsData.contactUs},
      {'title': AppLocalizations.of(context)!.aboutUs, 'asset': AssetsData.aboutUs},
      {'title': AppLocalizations.of(context)!.termsConditions, 'asset': AssetsData.termsAndConditions},
      {'title': AppLocalizations.of(context)!.privacyPolicy, 'asset': AssetsData.privacyPolicy},
      {
        'title': AppLocalizations.of(context)!.deleteAccount,
        'asset': AssetsData.deleteAccount,
        'function': () {}
      },
    ];
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // Listen to state changes and perform actions if needed
      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                //   backgroundColor: Colors.transparent,
                pinned: true,
                //  expandedHeight: MediaQuery.of(context).size.height * 0.12,
                flexibleSpace: FlexibleSpaceBar(
                  // title: Text('My Profile'),
                  background: HeaderWidget(
                    showArrow: false,
                    title: AppLocalizations.of(context)!.myProfile,
                  ),
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
