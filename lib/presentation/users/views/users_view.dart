import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_icons.dart';
import 'widgets/users_view_body.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});
  static const routeName = '/users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(Assets.assetsIconsLogo),
        elevation: 2,
        backgroundColor: Colors.white,
      ),
      body: const UsersViewBody(),
    );
  }
}
