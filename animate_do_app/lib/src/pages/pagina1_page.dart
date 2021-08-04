import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: FaIcon( FontAwesomeIcons.twitter ),
            onPressed: () {},
          ),

          IconButton(
            icon: Icon( Icons.navigate_next ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        title: Text('Animate_do'),
      ),
      body: Center(
        child: Column(
          children: [
            Icon( Icons.new_releases, color: Colors.blue, size: 40 ),

            Text('Titulo', style: TextStyle( fontSize: 40, fontWeight: FontWeight.w200 )),

            Text('Soy un texto pequeño', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400 )),

            Container(
              color: Colors.blue,
              height: 2,
              width: 220
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon( FontAwesomeIcons.play ),
        onPressed: () {},
      ),
    );
  }
}