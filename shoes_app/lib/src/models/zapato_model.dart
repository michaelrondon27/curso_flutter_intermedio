import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assetImage = 'assets/imgs/azul.png';
  double _talla = 9.0;

  String get assetImage => this._assetImage;
  double get talla => this._talla;

  set assetImage( String value ) {
    this._assetImage = value;

    notifyListeners();
  }

  set talla( double value ) {
    this._talla = value;
    
    notifyListeners();
  }
}
