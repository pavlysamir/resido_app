import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String placeHolder;
  final bool isPasswordTextField;
  final bool isObscurePassword;
  final TextEditingController? controller;
  final bool enable;

  const TextFieldWidget({
    Key? key,
    required this.labelText,
    required this.placeHolder,
    required this.isPasswordTextField,
    required this.isObscurePassword,
    this.controller,
    this.enable = true, // Default value set to true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        onChanged: (text){
          if(controller?.text ==''){
            // make label text visible is empty
          }
        },
        obscureText: isPasswordTextField ? isObscurePassword : false,
        enabled: enable ,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: isPasswordTextField
              ? IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
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
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
