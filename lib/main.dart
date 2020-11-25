import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اسم التطبيق',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF020B2D),
        accentColor: Color(0xFF494545),
        buttonColor: Color(0xFF222B45),
        hoverColor: Color(0xFF195C1E),
      ),
      home: Home(),
    );
  }
}
