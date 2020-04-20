import 'package:flutter/material.dart';
import 'package:shoes_app/src/pages/zapatos_pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShoesApp',
      home:ZapatosPage(),
      
    );
  }
}