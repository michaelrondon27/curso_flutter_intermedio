import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final double alto;
  final double ancho;
  final String texto;

  BotonNaranja({
    this.alto: 50,
    this.ancho: 150,
    required this.texto
  }); 
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text( this.texto, style: TextStyle( color: Colors.white ) ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 100 ),
        color: Colors.orange,
      ),
      height: this.alto,
      width: this.ancho
    );
  }
}
