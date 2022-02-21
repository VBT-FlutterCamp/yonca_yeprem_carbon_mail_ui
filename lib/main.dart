import 'package:flutter/material.dart';

import 'feature/view/home/view/http_homepage.dart';
import 'feature/view/welcome/welcome.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff293855),
      ),
      home: const HttpHomePage(),
    );
  }
}
