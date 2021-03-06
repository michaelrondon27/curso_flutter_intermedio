import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/widgets/headers.dart';
import 'package:disenos_app/src/widgets/boton_gordo.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge = false;

    if ( MediaQuery.of(context).size.height > 550 ) {
      isLarge = true;
    }

    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget> itemMap = items.map( (item) => FadeInLeft(
      child: BotonGordo(
        color1: item.color1,
        color2: item.color2,
        icon: item.icon,
        onPress: () {},
        texto: item.texto
      ),
      duration: Duration( milliseconds: 250 ),
    )).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: SafeArea(
              child: ListView(
                children: [
                  if ( isLarge )
                    SizedBox( height: 80 ),
            
                  ...itemMap
                ],
                physics: BouncingScrollPhysics()
              ),
            ),
            margin: EdgeInsets.only( top: (isLarge) ? 220 : 10 )
          ),

          if ( isLarge )
            _Encabezado(),
        ]
      )
    );
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
          icon: FontAwesomeIcons.plus,
          subtitulo: 'Haz Solicitado',
          titulo: 'Asistencia M??dica'
        ),

        Positioned(
          child: RawMaterialButton(
            child: FaIcon( FontAwesomeIcons.ellipsisV, color: Colors.white ),
            onPressed: () {},
            padding: EdgeInsets.all( 15 ),
            shape: CircleBorder()
          ),
          right: 0,
          top: 45
        )
      ],
    );
  }
}