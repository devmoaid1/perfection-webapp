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
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 9,
            crossAxisCount: 4,
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
  }
}
