import 'dart:math' as Math;

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({ Key? key }) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CustomPaint(
            painter: _MiRadialProgressPainter( 50 ),
          ),
          height: 300,
          padding: EdgeInsets.all(5),
          width: 300,
        ),
      ),
    );
  }
}

class _MiRadialProgressPainter extends CustomPainter {
  final porcentaje;

  _MiRadialProgressPainter(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height / 2);
    double radio = Math.min(size.width * 0.5, size.height *0.5);

    canvas.drawCircle(center, radio, paint);

    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * Math.pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -Math.pi / 2,
      arcAngle,
      false, 
      paintArco
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
