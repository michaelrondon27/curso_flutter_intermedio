import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        leading: FaIcon( FontAwesomeIcons.slideshare, color: Colors.blue ),
        onTap: () {},
        title: Text('Hola mundo'),
        trailing: Icon( Icons.chevron_right, color: Colors.blue ),
      ), 
      itemCount: 20,
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
                onChanged: ( vlaue ) {},
                value: true
              ),
            ),

            ListTile(
              leading: Icon( Icons.add_to_home_screen, color: Colors.blue ),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: Colors.blue,
                onChanged: ( vlaue ) {},
                value: true
              ),
            )
          ],
        ),
      ),
    );
  }
}
