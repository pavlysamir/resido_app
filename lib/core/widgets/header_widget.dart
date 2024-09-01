import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final bool showArrow;

  const HeaderWidget({Key? key, this.title = 'Edit Profile', this.showArrow = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          if (showArrow)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.blue),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF4D5454),
              fontStyle: FontStyle.normal,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}

