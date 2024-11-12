import 'package:flutter/material.dart';

import '../../../../core/theme/styles.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: Text(
      'Users View',
      style: Styles.font32SemiBold,
    )));
  }
}
