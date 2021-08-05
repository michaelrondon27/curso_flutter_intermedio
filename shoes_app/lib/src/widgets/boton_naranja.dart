import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;

  BotonNaranja({
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
      height: 50,
      width: 150,
    );
  }
}
