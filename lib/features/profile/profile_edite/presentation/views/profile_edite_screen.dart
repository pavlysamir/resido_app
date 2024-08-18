import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Assets/assets.dart';
import '../components/profile_edit_screen_components.dart';
import '../controller/profile_edite_cubit.dart';

class ProfileEditeScreen extends StatelessWidget {
  ProfileEditeScreen({super.key});

  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileEditeCubit(),
      child: BlocConsumer<ProfileEditeCubit, ProfileEditeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProfileEditeCubit.get(context);

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 0.0),
                  _buildProfileForm(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

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
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const Text(
            'Edit Profile',
            style: TextStyle(
              color: Color(0xFF4D5454),
              fontStyle: FontStyle.normal,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: GestureDetector(
        onTap: () {
          // cubit.updateProfile();
        },
        child: Column(
          children: [
            _buildProfileImage(context),
            const SizedBox(height: 0.0),
            _buildTextFieldSection('Full Name', 'demo user', false),
            _buildTextFieldSection('Email Address', 'demo@ebroker.com', false),
            _buildTextFieldSection('Phone Number', '9876543210', false),
            _buildTextFieldSection('Address', 'Time square, Bhuj Kutch', false),
            _buildLocationField(),
            _buildLocationNote(),
            _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Center(
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          color: const Color(0xFF087C7C),
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF087C7C),
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 10),
                  ),
                ],
                shape: BoxShape.circle,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.6tUU7elzE78McOxUt5y-wwHaEO?rs=1&pid=ImgDetMain'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  color: const Color(0xFF4D5454),
                ),
                child: const Image(
                  image: AssetImage(
                    AssetsData.profileEdit,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldSection(String label, String placeholder, bool isPassword) {
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
              color: Color(0xFF4D5454),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: buildTextField('', placeholder, isPassword),
        ),
      ],
    );
  }

  Widget _buildLocationField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: buildTextField('', 'Select Location (Optional)', false),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    icon: const Icon(Icons.my_location_rounded),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationNote() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0, bottom: 15.0),
      child: Text(
        'This location will enable new section in home screen for nearby properties',
      ),
    );
  }

  Widget _buildUpdateButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF087C7C),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            child: const Text(
              'Update Profile',
              style: TextStyle(
                color: Colors.white,
              ),

            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeHolder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
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