import 'package:flutter/material.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    this.validationMassage,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.isEyeTrue = false,
    this.initialValue,
    this.readOnly = false,
    this.onChange,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final Function(String value)? validationMassage;
  final bool isEyeTrue;
  final String? initialValue;
  final bool? readOnly;
  final Function(String)? onChange;

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (widget.onChange != null) ? widget.onChange : null,
      focusNode: _focusNode,
      readOnly: widget.readOnly!,
      initialValue: widget.initialValue,
      style: Theme.of(context).textTheme.titleMedium,
      obscureText: widget.isEyeTrue,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      validator: (value) {
        return widget.validationMassage!(value!);
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        filled: true,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        fillColor: Theme.of(context).appBarTheme.backgroundColor,
        enabledBorder: outlineInputBorder(context),
        focusedBorder: outlineFocusInputBorder(context),
        errorBorder: outlineInputBorderError(),
        hintText: widget.hintText,
        hintStyle: _focusNode.hasFocus
            ? Styles.textStyle14Grey.copyWith(color: AppColors.primaryColor)
            : Styles.textStyle14Grey,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
      ),
    );
  }
}

InputBorder? outlineInputBorder(BuildContext context) {
  return Theme.of(context).inputDecorationTheme.enabledBorder;
}

InputBorder? outlineFocusInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primaryColor),
    borderRadius: BorderRadius.circular(10.0),
  );
}

OutlineInputBorder outlineInputBorderError() {
  return OutlineInputBorder(
    borderSide:
        const BorderSide(color: Colors.red), // Border color changes to red
    borderRadius: BorderRadius.circular(14),
  );
}




  // onChanged: (String _) {
  //                 searchCubit.search(
  //                   1,
  //                 );
  //               },