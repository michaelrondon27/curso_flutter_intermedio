import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';

import 'package:shoes_app/src/pages/zapato_page.dart';
 
void main() {
  return runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider( create: (_) => new ZapatoModel() )
      ],
    )
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ZapatoPage(),
      title: 'Shoes App'
    );
  }
}