import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {
  final String descripcion;
  final String titulo;

  ZapatoDescripcion({
    required this.descripcion,
    required this.titulo
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox( height: 20 ),

          Text(
            this.titulo,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700
            ),
          ),

          SizedBox( height: 20 ),

          Text(
            this.descripcion,
            style: TextStyle(
              color: Colors.black54,
              height: 1.6
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: EdgeInsets.symmetric( horizontal: 30 ),
    );
  }
}