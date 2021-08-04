import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/src/theme/theme.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Diseños en Flutter'),
      ),
      body: _ListaOpciones(),
      drawer: _MenuPrincipal(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ( context, i ) => ListTile(
        leading: FaIcon( pageRoutes[i].icon, color: Colors.blue ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: ( context ) => pageRoutes[i].page));
        },
        title: Text(pageRoutes[i].title),
        trailing: Icon( Icons.chevron_right, color: Colors.blue ),
      ), 
      itemCount: pageRoutes.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: ( context, i ) => Divider(
        color: Colors.blue,
      )
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
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
              leading: Icon( Icons.lightbulb_outline, color: Colors.blue ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: Colors.blue,
                onChanged: ( value ) {
                  appTheme.darkTheme = value;
                },
                value: appTheme.darkTheme
              ),
            ),

            SafeArea(
              bottom: true,
              child: ListTile(
                leading: Icon( Icons.add_to_home_screen, color: Colors.blue ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: Colors.blue,
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
