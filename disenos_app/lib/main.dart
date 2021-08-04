import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/theme/theme.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    child: MyApp(),
    create: (_) => new ThemeChanger( 1 ),
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LauncherPage(),
      theme: currentTheme,
      title: 'Diseños App',
    );
  }
}