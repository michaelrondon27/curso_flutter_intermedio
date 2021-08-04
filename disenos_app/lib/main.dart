import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/launcher_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LauncherPage(),
      title: 'Diseños App',
    );
  }
}