// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets.dart';

class AuthorDetail extends StatelessWidget {
  final Color color;
  const AuthorDetail({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: const NetworkImage(
              'https://img.freepik.com/free-psd/3d-rendering-boy-avatar-emoji_23-2150603406.jpg?w=826&t=st=1696157440~exp=1696158040~hmac=450dd4ea617dc225afb26e6aeb4093f082a08748c5973679a38544448186f55e'),
          radius: 8.r,
        ),
        horizontalSpace(8.w),
        Text(
          "Asha Benjamin - 6 mins read",
          style: TextStyle(
            fontSize: 10.sp,
            color: color,
          ),
        )
      ],
    );
  }
}
