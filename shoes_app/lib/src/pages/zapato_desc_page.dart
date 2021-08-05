import 'package:flutter/material.dart';

import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ZapatoSizePreview(
            fullScreen: true
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescripcion(
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    titulo: 'Nike Air Max 720'
                  ),

                  _MontoBuyNow()
                ]
              )
            )
          )
        ]
      )
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              )
            ),

            Spacer(),

            BotonNaranja(
              alto: 40,
              ancho: 120,
              texto: 'Buy Now',
            )
          ]
        ),
        margin: EdgeInsets.only( top: 20 ),
      ),
      padding: EdgeInsets.symmetric( horizontal: 30 )
    );
  }
}