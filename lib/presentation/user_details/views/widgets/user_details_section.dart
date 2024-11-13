import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfection_webapp/core/helpers/extensions/spaces.dart';

import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_text_field.dart';

class UserDetailsSection extends StatelessWidget {
  final String title;
  final String value;

  const UserDetailsSection(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: Styles.font18Regular,
      ),
      15.h.vSpace,
      CustomTextField(
        intialValue: value,
      ),
    ]);
  }
}
