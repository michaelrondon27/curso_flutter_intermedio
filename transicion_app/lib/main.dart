import 'package:flutter/material.dart';

import 'package:transicion_app/pages/pagina1_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pagina1Page(),
      title: 'Transicion App',
    );
  }
}