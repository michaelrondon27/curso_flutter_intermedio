import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:animate_do_app/src/pages/twitter_page.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: FaIcon( FontAwesomeIcons.twitter ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ( BuildContext context ) => TwitterPage() ));
            },
          ),

          SlideInLeft(
            child: IconButton(
              icon: Icon( Icons.navigate_next ),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: ( BuildContext context ) => Pagina1Page() ));
              },
            ),
            from: 100,
          )
        ],
        centerTitle: true,
        title: FadeIn(
          child: Text('Animate_do'),
          duration: Duration( milliseconds: 500 ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElasticIn(
              child: Icon( Icons.new_releases, color: Colors.blue, size: 40 ),
              delay: Duration( milliseconds: 1100 ),
            ),

            FadeInDown(
              child: Text('Titulo', style: TextStyle( fontSize: 40, fontWeight: FontWeight.w200 )),
              delay: Duration( milliseconds: 200 ),
            ),

            FadeInDown(
              child: Text('Soy un texto pequeño', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400 )),
              delay: Duration( milliseconds: 800 ),
            ),

            FadeInLeft(
              child: Container(
                color: Colors.blue,
                height: 2,
                width: 220
              ),
              delay: Duration( milliseconds: 1100 ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon( FontAwesomeIcons.play ),
          onPressed: () {},
        ),
      ),
    );
  }
}