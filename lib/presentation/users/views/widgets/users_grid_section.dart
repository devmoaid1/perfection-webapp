import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfection_webapp/core/helpers/extensions/spaces.dart';
import 'package:perfection_webapp/presentation/users/cubit/cubit/users_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/dependencies.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/styles.dart';
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
        crossAxisCount = 4;
      } else if (width > 600) {
        crossAxisCount = 3;
      } else if (width > 400) {
        crossAxisCount = 2;
      } else {
        crossAxisCount = 1;
      }
      return BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorMessage!)));
          }
        },
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return Skeletonizer(
                enabled: true,
                child: GridView.builder(
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
                          avatarUrl: 'https://reqres.in/img/faces/1-image.jpg',
                          fullName: 'Moaid Mohamed');
                      return UserCard(
                        user: user,
                      );
                    }),
              );
            case Status.success:
              return Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.users.length,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 16 / 9,
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 20.w,
                          mainAxisSpacing: 20.h),
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return UserCard(
                          user: user,
                        );
                      }),
                  50.h.vSpace,
                  GestureDetector(
                      onTap: () {
                        final usersCubit = BlocProvider.of<UsersCubit>(context);

                        usersCubit.loadMore();
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Load more>>',
                          style: Styles.font14Regularwhite
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ))
                ],
              );
            case Status.error:
              return Center(
                child: Text(
                  state.errorMessage!,
                  style: Styles.font18Regular,
                ),
              );
          }
        },
      );
    });
  }
}
