import 'package:flutter/material.dart';

import '../views/home_view.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const HomeView(),
    );
  }
}
