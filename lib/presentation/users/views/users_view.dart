import 'package:flutter/material.dart';

import 'widgets/users_view_body.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});
  static const routeName = '/users';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UsersViewBody(),
    );
  }
}
