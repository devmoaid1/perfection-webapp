import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfection_webapp/core/dependencies.dart';

import 'package:perfection_webapp/core/helpers/extensions/spaces.dart';
import 'package:perfection_webapp/presentation/users/cubit/cubit/users_cubit.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/styles.dart';
import 'header_section.dart';

import 'users_grid_section.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersCubit>(
      create: (context) => sl<UsersCubit>()..fetchUsers(1),
      child: SingleChildScrollView(
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
            const UsersGridSection(),
          ],
        ),
      ),
    );
  }
}
