import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talent_hub/core/helpers/extensions.dart';

import '../../../../../core/theme/app_colors.dart';
import 'user_image_circle_avatar.dart';

class ChatDetailsAppBarLeading extends StatelessWidget {
  const ChatDetailsAppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.r),
      onTap: () {
        context.pop();
      },
      child: Row(
        children: [
          const Icon(Icons.arrow_back, color: AppColors.white),
          UserImageCircleAvatar(
            image: "assets/images/default_user.png",
            radius: 15.r,
          )
        ],
      ),
    );
  }
}