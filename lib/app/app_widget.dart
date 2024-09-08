import 'package:flutter/material.dart';
import 'package:flutter_unit_tests_app/app/pages/register_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
    );
  }
}
