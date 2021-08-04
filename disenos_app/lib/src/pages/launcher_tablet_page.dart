import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/src/theme/theme.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.accentColor,
        centerTitle: true,
        title: Text('Diseños en Flutter - Tablet'),
      ),
      body: _ListaOpciones(),
      drawer: _MenuPrincipal(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      itemBuilder: ( context, i ) => ListTile(
        leading: FaIcon( pageRoutes[i].icon, color: appTheme.accentColor ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: ( context ) => pageRoutes[i].page));
        },
        title: Text(pageRoutes[i].title),
        trailing: Icon( Icons.chevron_right, color: appTheme.accentColor ),
      ), 
      itemCount: pageRoutes.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: ( context, i ) => Divider(
        color: appTheme.primaryColorLight
      )
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text('MR', style: TextStyle( fontSize: 50 )),
                ),
                height: 200,
                padding: EdgeInsets.all( 5 ),
                width: double.infinity
              ),
            ),

            Expanded(
              child: _ListaOpciones()
            ),

            ListTile(
              leading: Icon( Icons.lightbulb_outline, color: accentColor ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                onChanged: ( value ) {
                  appTheme.darkTheme = value;
                },
                value: appTheme.darkTheme
              ),
            ),

            SafeArea(
              bottom: true,
              child: ListTile(
                leading: Icon( Icons.add_to_home_screen, color: accentColor ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: accentColor,
                  onChanged: ( value ) {
                    appTheme.customTheme = value;
                  },
                  value: appTheme.customTheme
                ),
              ),
              left: false,
              right: false,
              top: false
            )
          ],
        ),
      ),
    );
  }
}
