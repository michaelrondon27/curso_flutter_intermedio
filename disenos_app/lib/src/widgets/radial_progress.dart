import 'dart:math' as Math;

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;

  RadialProgress({
    required this.porcentaje 
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() { 
    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(
      duration: Duration( milliseconds: 200 ),
      vsync: this
    );

    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward( from: 0.0 );

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          child: CustomPaint(
            painter: _MiRadialProgressPainter( (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value) ),
          ),
          height: double.infinity,
          padding: EdgeInsets.all( 10 ),
          width: double.infinity
        );
      }
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
