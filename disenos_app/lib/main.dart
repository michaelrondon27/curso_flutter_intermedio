import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/pages/launcher_tablet_page.dart';
import 'package:disenos_app/src/theme/theme.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    child: MyApp(),
    create: (_) => new ThemeChanger( 2 ),
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;

          if ( screenSize.width > 500 ) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
      theme: currentTheme,
      title: 'Diseños App',
    );
  }
}