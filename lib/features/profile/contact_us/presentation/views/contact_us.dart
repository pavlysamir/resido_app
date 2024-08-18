import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resido_app/core/Assets/assets.dart';

import '../components/contact_us_components.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How can we help you?',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
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
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10.0), // Change border radius
                        ),
                        child: Image.asset(
                          AssetsData.call, // Replace with the correct image path
                          color: const Color(0xFF087C7C), // Optional: Set image color if needed
                          width: 24.0, // Optional: Set width
                          height: 24.0, // Optional: Set height
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      const Text(
                        'Call',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF4D5454),
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
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10.0), // Change border radius
                      ),
                      child: Image.asset(
                        AssetsData.makeACall, // Replace with the correct image path
                        color: const Color(0xFF087C7C), // Optional: Set image color if needed
                        width: 24.0, // Optional: Set width
                        height: 24.0, // Optional: Set height
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10.0), // Change border radius
                      ),
                      child: Image.asset(
                        AssetsData.message, // Replace with the correct image path
                        color: const Color(0xFF087C7C), // Optional: Set image color if needed
                        width: 24.0, // Optional: Set width
                        height: 24.0, // Optional: Set height
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10.0), // Change border radius
                      ),
                      child: Image.asset(
                        AssetsData.whatsApp, // Replace with the correct image path
                        color: const Color(0xFF087C7C), // Optional: Set image color if needed
                        width: 24.0, // Optional: Set width
                        height: 24.0, // Optional: Set height
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
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10.0), // Change border radius
                      ),
                      child: Image.asset(
                        AssetsData.phoneNumber, // Replace with the correct image path
                        color: const Color(0xFF087C7C), // Optional: Set image color if needed
                        width: 24.0, // Optional: Set width
                        height: 24.0, // Optional: Set height
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    const Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF4D5454),
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
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10.0), // Change border radius
                      ),
                      child: Image.asset(
                        AssetsData.makeACall, // Replace with the correct image path
                        color: const Color(0xFF087C7C), // Optional: Set image color if needed
                        width: 24.0, // Optional: Set width
                        height: 24.0, // Optional: Set height
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10.0), // Change border radius
                      ),
                      child: Image.asset(
                        AssetsData.message, // Replace with the correct image path
                        color: const Color(0xFF087C7C), // Optional: Set image color if needed
                        width: 24.0, // Optional: Set width
                        height: 24.0, // Optional: Set height
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10.0), // Change border radius
                      ),
                      child: Image.asset(
                        AssetsData.whatsApp, // Replace with the correct image path
                        color: const Color(0xFF087C7C), // Optional: Set image color if needed
                        width: 24.0, // Optional: Set width
                        height: 24.0, // Optional: Set height
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
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10.0), // Change border radius
                      ),
                      child: Image.asset(
                        AssetsData.mailUs, // Replace with the correct image path
                        color: const Color(0xFF087C7C), // Optional: Set image color if needed
                        width: 24.0, // Optional: Set width
                        height: 24.0, // Optional: Set height
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    const Text(
                      'Contact us with email address',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF4D5454),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            const SizedBox(height: 20),
            const CustomTextField(
              labelText: '',
              placeHolder: 'Subject',
              isPasswordTextField: false,
            ),
            const CustomTextField(
              labelText: '',
              placeHolder: 'Admin@ebroker.in',
              isPasswordTextField: false,
            ),
            const CustomTextField(
              labelText: '',
              placeHolder: 'Write something here...',
              isPasswordTextField: false,
              lines: 6,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity, // Take all available width
              decoration: BoxDecoration(
                color: const Color(0xFF087C7C), // Background color
                borderRadius: BorderRadius.circular(10.0), // Optional: Set border radius
              ),
              child: TextButton(
                onPressed: () {
                  // Add your onPressed logic here
                },
                child: const Text(
                  'Send',
                  style: TextStyle(
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
