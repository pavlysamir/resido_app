
import 'package:flutter/cupertino.dart';
import 'package:resido_app/features/profile/profile_edite/presentation/components/profile_edit_screen_components.dart';

import '../../../../../core/utils/app_colors.dart';

class TextFieldSectionWidget extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isPassword;
  final TextEditingController controller;
  final bool enable;

  const TextFieldSectionWidget({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.isPassword,
    required this.controller,
    this.enable = true,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.darkGrey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextFieldWidget(
            labelText: '',
            placeHolder: placeholder,
            isPasswordTextField: isPassword,
            isObscurePassword: true, // or false, depending on your logic
            controller: controller,
            enable: enable,
          ),
        )
      ],
    );
  }
}

