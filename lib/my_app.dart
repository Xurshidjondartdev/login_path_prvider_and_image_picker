import 'package:flutter/material.dart';
import 'package:learn_path_provider/pages/registor_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: RegitorPage());
  }
}
