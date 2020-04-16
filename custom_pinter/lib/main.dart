// import 'package:custom_pinter/src/pages/circular_progress.dart';
// import 'package:custom_pinter/src/retos/animated_retos.dart';
import 'package:flutter/material.dart';
// import 'src/pages/graficas_circulares_pages.dart';
import 'src/pages/pinterest_page.dart';
// import 'src/pages/slideshow_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pointer',
      home:PinterestPage(),
    );
  }
}