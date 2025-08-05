import 'package:classroom/start_page/register_page_desktop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF2F5C4A),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green, // Base do MaterialColor
        ).copyWith(primary: const Color(0xFF2F5C4A)),
      ),
      home: const RegisterPageDesktop(),
    );
  }
}
