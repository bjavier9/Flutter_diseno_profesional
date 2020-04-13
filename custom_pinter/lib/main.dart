import 'package:custom_pinter/src/retos/animated_retos.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pointer',
      home:AnimacionesPageRetos()
    );
  }
}