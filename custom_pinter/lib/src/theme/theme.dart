import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;
  ThemeChanger (int theme){
    switch (theme) {
      case 1: 
        _darkTheme=false;
        _currentTheme=ThemeData.light().copyWith(
          accentColor: Colors.pink
        );
        _customTheme=false;
        break;  
      case 2:
        _darkTheme=true;
        _currentTheme=ThemeData.dark();
        _customTheme=false;
      break;
      case 3:
        _darkTheme=false;
        _customTheme=true;
        break;
      default:
           _darkTheme=false;
        _currentTheme=ThemeData.light();
        _customTheme=false;      
    }
  }


  bool get darkTheme=>this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;
  set darkTheme(bool value){
    _customTheme=false;
    _darkTheme=value;
  if(value){
    _currentTheme=ThemeData.dark().copyWith(
      accentColor: Color(0xff48A0E8),
      primaryColorLight: Colors.white,
      scaffoldBackgroundColor: Color(0xff162028),
      textTheme: TextTheme(
        body1: TextStyle(color: Colors.white)
      )

    );
  }else{
    _currentTheme=ThemeData.light().copyWith(
      accentColor: Colors.pink
    );
  }


    notifyListeners();
  }
set customTheme(bool value){
    _customTheme=value;
    _darkTheme=false;
    notifyListeners();
  }


} 