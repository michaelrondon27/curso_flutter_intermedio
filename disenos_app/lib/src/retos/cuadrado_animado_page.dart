import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> moverAbajo;
  late Animation<double> moverArriba;
  late Animation<double> moverDerecha;
  late Animation<double> moverIzquierda;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration( milliseconds: 4500 ),
      vsync: this
    );

    moverDerecha = Tween(
      begin: 0.0,
      end: 100.0
    ).animate(
      CurvedAnimation(
        curve: Interval(0, 0.25, curve: Curves.bounceOut), 
        parent: controller
      )
    );

    moverArriba = Tween(
      begin: 0.0,
      end: -100.0
    ).animate(
      CurvedAnimation(
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut), 
        parent: controller
      )
    );

    moverIzquierda = Tween(
      begin: 0.0,
      end: -100.0
    ).animate(
      CurvedAnimation(
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut), 
        parent: controller
      )
    );

    moverAbajo = Tween(
      begin: 0.0,
      end: 100.0
    ).animate(
      CurvedAnimation(
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut), 
        parent: controller
      )
    );

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
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          child: child,
          offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value)
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
