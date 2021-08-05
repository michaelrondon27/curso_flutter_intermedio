import 'package:flutter/material.dart';

import 'package:shoes_app/src/widgets/custom_widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;

  AgregarCarritoBoton({
    required this.monto
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: Row(
          children: [
            SizedBox( width: 20 ),
            
            Text(
              '\$$monto',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              )
            ),

            Spacer(),

            BotonNaranja(
              texto: 'Add to cart'
            ),

            SizedBox( width: 20 )
          ]
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 100 ),
          color: Colors.grey.withOpacity( 0.1 )
        ),
        height: 100,
        width: double.infinity
      ),
      padding: EdgeInsets.all( 10 ),
    );
  }
}