import 'package:flutter/material.dart';
import 'package:zartek_test/view/pages/authentication_screen/authentication_screen.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: AuthenticationScreen(),
    );
  }
}
