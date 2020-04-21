import 'package:flutter/services.dart' as services;

void statusBarLight(){
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.light);
}


void statusBarDark(){
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.dark);
}