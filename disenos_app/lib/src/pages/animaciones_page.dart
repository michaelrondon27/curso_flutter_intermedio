import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacidad;
  late Animation<double> rotacion;

  @override
  void initState() {
    controller = new AnimationController(
      duration: Duration( milliseconds: 4000 ),
      vsync: this
    );

    rotacion = Tween(
      begin: 0.0,
      end: 2 * Math.pi
    ).animate(
      CurvedAnimation(
        curve: Interval(0, 0.25, curve: Curves.easeOut),
        parent: controller
      )
    );

    opacidad = Tween(
      begin: 0.1,
      end: 1.0
    ).animate( controller );

    controller.addListener(() {
      if ( controller.status == AnimationStatus.completed ) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.rotate(
          angle: rotacion.value,
          child: Opacity(
            child: childRectangulo,
            opacity: opacidad.value
          )
        );
      },
      child: _Rectangulo(),
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      height: 70,
      width: 70
    );
  }
}
