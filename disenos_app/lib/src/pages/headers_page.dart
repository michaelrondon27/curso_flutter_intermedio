import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;
    return Scaffold(
      body: HeaderWave(
        color: accentColor,
      ),
    );
  }
}
