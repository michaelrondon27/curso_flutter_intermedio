import 'package:flutter/material.dart';

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
  late Animation<double> rotacion;

  @override
  void initState() {
    controller = new AnimationController(
      duration: Duration( milliseconds: 4000 ),
      vsync: this
    );

    rotacion = Tween(
      begin: 0.0,
      end: 2.0
    ).animate( controller );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Rectangulo();
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
