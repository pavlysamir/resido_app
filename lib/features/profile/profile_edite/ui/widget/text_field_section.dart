import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resido_app/core/utils/widgets/custom_form_field.dart';
import 'package:resido_app/features/profile/profile_edite/ui/widget/text_field_widget.dart';

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
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomFormField(
              controller: controller,
              hintText: '',
              textInputType: TextInputType.text,
            )
            // TextFieldWidget(
            //   labelText: '',
            //   placeHolder: placeholder,
            //   isPasswordTextField: isPassword,
            //   isObscurePassword: true, // or false, depending on your logic
            //   controller: controller,
            //   enable: enable,
            // ),
            )
      ],
    );
  }
}
