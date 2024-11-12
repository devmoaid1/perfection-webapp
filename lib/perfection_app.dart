import 'package:flutter/material.dart';
import 'package:perfection_webapp/core/routing.dart';

import 'presentation/users/views/users_view.dart';

class PerfectionApp extends StatelessWidget {
  const PerfectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfection',
      onGenerateRoute: onGenerateRoute,
      initialRoute: UsersView.routeName,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
