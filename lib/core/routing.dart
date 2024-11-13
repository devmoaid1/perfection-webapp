import 'package:flutter/material.dart';
import 'package:perfection_webapp/presentation/user_details/views/user_details_view.dart';

import '../domain/entities/user_entity.dart';
import '../presentation/users/views/users_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case UserDetailsView.routeName:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            UserDetailsView(user: settings.arguments as UserEntity),
        transitionsBuilder: transitionBuilder,
      );
    case UsersView.routeName:
    default:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const UsersView(),
        transitionsBuilder: transitionBuilder,
      );

    // Add more cases for other routes here...
  }
}

Widget transitionBuilder(context, animation, secondaryAnimation, child) {
  var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
  return FadeTransition(opacity: fadeAnimation, child: child);
}
