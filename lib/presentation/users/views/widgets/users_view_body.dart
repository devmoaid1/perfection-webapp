import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:perfection_webapp/core/helpers/extensions/spaces.dart';

import 'package:perfection_webapp/domain/entities/user_entity.dart';

import '../../../../core/theme/styles.dart';
import 'header_section.dart';
import 'user_card.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderSection(),
          20.h.vSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Users',
              style: Styles.font32SemiBold,
            ),
          ),
          20.h.vSpace,
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h),
              itemBuilder: (context, index) {
                final user = UserEntity(
                    id: index,
                    email: 'moaidmohamed123@gmail.com',
                    avatarUrl: '',
                    fullName: 'Moaid Mohamed');
                return UserCard(
                  user: user,
                );
              })
        ],
      ),
    );
  }
}
