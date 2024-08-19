import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resido_app/core/Assets/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/app_colors.dart';
import '../components/contact_us_components.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.contactUs),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blue),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body:const HelpSectionWidget(),
    );
  }
}
