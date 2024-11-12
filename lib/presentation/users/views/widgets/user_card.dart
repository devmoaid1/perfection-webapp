import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfection_webapp/core/helpers/extensions/spaces.dart';
import 'package:perfection_webapp/core/widgets/custom_network_image.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../domain/entities/user_entity.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;
  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80.0,
                height: 80.0,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipOval(
                    child: AppImage(
                      path: "https://reqres.in/img/faces/1-image.jpg",
                      fit: BoxFit
                          .cover, // استخدم cover لضمان تناسب الصورة داخل الدائرة
                    ),
                  ),
                ),
              ),
              20.w.hSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        user.fullName,
                        style: Styles.font18Regular,
                      ),
                    ),
                    20.h.vSpace,
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        user.email,
                        style: Styles.font16RegularLightGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: IndicatorCard(label: user.id.toString())),
        const Align(
            alignment: Alignment.bottomRight,
            child: IndicatorCard(
              label: 'View Details >>',
            ))
      ],
    );
  }
}

class IndicatorCard extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  const IndicatorCard({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Text(label, style: Styles.font14Regularwhite),
      ),
    );
  }
}
