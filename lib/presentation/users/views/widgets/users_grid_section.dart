import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/user_entity.dart';
import 'user_card.dart';

class UsersGridSection extends StatelessWidget {
  const UsersGridSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (contex, constraints) {
      late int crossAxisCount;
      double width = constraints.maxWidth;

      if (width > 800) {
        crossAxisCount = 4; // شاشات كبيرة
      } else if (width > 600) {
        crossAxisCount = 3; // شاشات متوسطة
      } else if (width > 400) {
        crossAxisCount = 2; // شاشات صغيرة
      } else {
        crossAxisCount = 1; // شاشات أصغر
      }
      return GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16 / 9,
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h),
          itemBuilder: (context, index) {
            final user = UserEntity(
                id: index,
                email: 'moaidmohamed123@gmail.com',
                avatarUrl: '',
                fullName: 'Moaid Mohamed');
            return UserCard(
              user: user,
            );
          });
    });
  }
}
