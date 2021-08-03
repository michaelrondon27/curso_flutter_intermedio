import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;
  final Function() onPress;
  final String texto;

  BotonGordo({
    this.color1: Colors.grey,
    this.color2: Colors.blueGrey,
    this.icon: FontAwesomeIcons.circle,
    required this.onPress,
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          _BotonGordoBackground(
            this.color1,
            this.color2,
            this.icon
          ),
    
          Row(
            children: [
              SizedBox( height: 140, width: 40 ),
    
              FaIcon(
                this.icon,
                color: Colors.white,
                size: 40
              ),
    
              SizedBox( width: 20 ),
    
              Expanded(
                child: Text(
                  this.texto,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),  
                ),
              ),
    
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white
              ),
    
              SizedBox( width: 40 )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
      onTap: this.onPress,
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;

  _BotonGordoBackground(
    this.color1,
    this.color2,
    this.icon
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular( 15 ),
        child: Stack(
          children: [
            Positioned(
              child: FaIcon(
                this.icon,
                color: Colors.white.withOpacity( 0.2 ),
                size: 150
              ),
              right: -20,
              top: -20
            )
          ]
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 15 ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity( 0.2 ),
            offset: Offset(4, 6)
          )
        ],
        gradient: LinearGradient(
          colors: [
            this.color1,
            this.color2
          ]
        )
      ),
      margin: EdgeInsets.all( 20 ),
      height: 100,
      width: double.infinity,
    );
  }
}
