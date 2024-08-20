import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/Assets/assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String placeHolder;
  final bool isPasswordTextField;
  final bool isObscurePassword;
  final int lines;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.placeHolder,
    required this.isPasswordTextField,
    this.isObscurePassword = false,
    this.lines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        maxLines: lines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: isPasswordTextField
              ? IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_red_eye, color:AppColors.grey),
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          hintText: placeHolder,
          hintStyle:  Styles.textStyle16Grey,
          fillColor: AppColors.white,
          filled: true,
        ),
      ),
    );
  }
}

class HelpSectionWidget extends StatelessWidget {
  const HelpSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How can we help you?',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text('It Look likes you have problems with our systems. we are here to help you, so, please get in touch with us.'),
          const SizedBox(height: 35.0),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      AssetsData.call,
                      color: AppColors.primaryColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Text(
                    AppLocalizations.of(context)!.callUs,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      AssetsData.makeACall,
                      color: AppColors.primaryColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      AssetsData.message,
                      color: AppColors.primaryColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      AssetsData.whatsApp,
                      color: AppColors.primaryColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      AssetsData.phoneNumber,
                      color: AppColors.primaryColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Text(
                    AppLocalizations.of(context)!.phone,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      AssetsData.makeACall,
                      color: AppColors.primaryColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      AssetsData.message,
                      color: AppColors.primaryColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      AssetsData.whatsApp,
                      color: AppColors.primaryColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10.0),
          Divider(),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      AssetsData.mailUs,
                      color: AppColors.primaryColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  const Text(
                    'Contact us with email address',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: '',
            placeHolder: AppLocalizations.of(context)!.subject,
            isPasswordTextField: false,
          ),
          const CustomTextField(
            labelText: '',
            placeHolder: 'Admin@ebroker.in',
            isPasswordTextField: false,
          ),
          CustomTextField(
            labelText: '',
            placeHolder: AppLocalizations.of(context)!.writeSomethingHere,
            isPasswordTextField: false,
            lines: 6,
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              child: Text(
                AppLocalizations.of(context)!.send,
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
