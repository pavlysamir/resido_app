import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/Assets/assets.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF087C7C),
          borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius
        ),
        child: TextButton.icon(
          onPressed: onPressed,
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0), // Add border radius
            ),
            padding: const EdgeInsets.all(4.0),
            child: const Icon(
              Icons.power_settings_new_outlined,
              color: Color(0xFF087C7C), // Set icon color
            ),
          ),
          label: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
      ),
    );
  }
}
