import 'package:flutter/material.dart';

import 'presentation/users/views/users_view.dart';

class PerfectionApp extends StatelessWidget {
  const PerfectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfection',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UsersView(),
    );
  }
}
