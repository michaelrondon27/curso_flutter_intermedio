import 'package:flutter/material.dart';

import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            texto: 'For you',
          ),

          SizedBox( height: 20 ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    child: ZapatoSizePreview(),
                    tag: 'zapato-1',
                  ),

                  ZapatoDescripcion(
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    titulo: 'Nike Air Max 720'
                  )
                ]
              ),
              physics: BouncingScrollPhysics()
            )
          ),

          AgregarCarritoBoton(
            monto: 180.0
          )
        ],
      ),
    );
  }
}
