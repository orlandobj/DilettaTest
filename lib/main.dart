

import 'package:diletta_teste/firebase_options.dart';
import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'core/imports/imports.dart';
import 'modules/modules.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: LoginScreen(),
    );
  }
}
