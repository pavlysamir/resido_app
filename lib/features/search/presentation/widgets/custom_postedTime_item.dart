import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemPostedTime extends StatelessWidget {
  const CustomItemPostedTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        width: 90.w,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Text(
            'AnyTime',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey[700]),
          ),
        ),
      ),
    );
  }
}
