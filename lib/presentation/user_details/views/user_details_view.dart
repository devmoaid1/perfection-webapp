import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfection_webapp/core/helpers/extensions/spaces.dart';
import 'package:perfection_webapp/core/theme/app_colors.dart';
import 'package:perfection_webapp/presentation/user_details/views/widgets/user_details_section.dart';

import '../../../core/theme/styles.dart';
import '../../../domain/entities/user_entity.dart';
import '../../users/views/widgets/user_card.dart';

class UserDetailsView extends StatelessWidget {
  final UserEntity user;
  const UserDetailsView({super.key, required this.user});
  static const routeName = '/user-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.25,
            height: MediaQuery.sizeOf(context).height * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 6.r)],
            ),
            child: Column(
              children: [
                50.h.vSpace,
                SizedBox(
                    width: 150.w,
                    height: 150.w,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CircularImage(
                        avatarUrl: user.avatarUrl,
                      ),
                    )),
                20.h.vSpace,
                Text("id :  ${user.id.toString()}",
                    style: Styles.font16RegularLightGrey),
                20.h.vSpace,
                UserDetailsSection(title: 'Full Name', value: user.fullName),
                20.h.vSpace,
                UserDetailsSection(title: 'Email', value: user.email),
              ],
            ),
          ),
          Positioned(
            top: 20.h,
            left: 20.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.lightGrey, // Customize the color
                // Customize the size
              ),
            ),
          ),
        ],
      )),
    );
  }
}
