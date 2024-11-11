import 'package:flutter/material.dart';
import 'package:perfection_webapp/core/dependencies.dart';
import 'package:perfection_webapp/perfection_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const PerfectionApp());
}
