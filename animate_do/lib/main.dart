

import 'package:custom_pinter/src/pages/pagina1_page.dart';
import 'package:flutter/material.dart';

// import 'src/pages/navegacion_page.dart';
import 'src/pages/pagina1_page.dart';
// import 'src/pages/twitter_pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ANIMATE_DO',
      home: Pagina1Page(),      
    );
  }
}