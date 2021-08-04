import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  late ThemeData _currentTheme;
  bool _customTheme = false;
  bool _darkTheme = false;

  ThemeData get currentTheme => this._currentTheme;
  bool get customTheme => this._customTheme;
  bool get darkTheme => this._darkTheme;

  ThemeChanger( int theme ) {
    switch ( theme ) {
      case 1:
        this._darkTheme = false;
        this._customTheme = false;
        this._currentTheme = ThemeData.light();
        break;

      case 2:
        this._darkTheme = true;
        this._customTheme = false;
        this._currentTheme = ThemeData.dark();
        break;

      case 3:
        this._darkTheme = false;
        this._customTheme = true;
        break;

      default:
        this._darkTheme = false;
        this._customTheme = false;
        this._currentTheme = ThemeData.light();
        break;
    }
  }

  set customTheme( bool value ) {
    this._customTheme = value;
    this._darkTheme = false;

    if ( value ) {
      this._currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle( color: Colors.white )
        )
      );
    } else {
      this._currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set darkTheme( bool value ) {
    this._customTheme = false;
    this._darkTheme = value;

    if ( value ) {
      this._currentTheme = ThemeData.dark();
    } else {
      this._currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
