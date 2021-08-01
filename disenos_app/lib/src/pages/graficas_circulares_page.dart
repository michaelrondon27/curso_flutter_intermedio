import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/radial_progress.dart';

class GraficasCircularesPAge extends StatefulWidget {
  @override
  _GraficasCircularesPAgeState createState() => _GraficasCircularesPAgeState();
}

class _GraficasCircularesPAgeState extends State<GraficasCircularesPAge> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              CustomRadialProgress(
                color: Colors.blue,
                porcentaje: porcentaje
              ),
              
              CustomRadialProgress(
                color: Colors.red,
                porcentaje: porcentaje
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround
          ),

          Row(
            children: [
              CustomRadialProgress(
                color: Colors.pink,
                porcentaje: porcentaje
              ),
              
              CustomRadialProgress(
                color: Colors.purple,
                porcentaje: porcentaje
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh ),
        onPressed: () {
          setState(() {
            porcentaje += 10;

            if ( porcentaje > 100 ) {
              porcentaje = 0;
            }
          });
        }
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  final double porcentaje;

  const CustomRadialProgress({
    required this.color,
    required this.porcentaje
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadialProgress(
        colorPrimario: color,
        colorSecundario: Colors.grey,
        grosorPrimario: 2,
        grosorSecundario: 1,
        porcentaje: porcentaje
      ),
      height: 180,
      width: 180,
    );
  }
}
