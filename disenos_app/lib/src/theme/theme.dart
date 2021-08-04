import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _customTheme = false;
  bool _darkTheme = false;

  bool get customTheme => this._customTheme;
  bool get darkTheme => this._darkTheme;

  set customTheme( bool value ) {
    this._customTheme = value;
    this._darkTheme = false;

    notifyListeners();
  }

  set darkTheme( bool value ) {
    this._customTheme = false;
    this._darkTheme = value;

    notifyListeners();
  }
}
