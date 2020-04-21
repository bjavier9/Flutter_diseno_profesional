import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/model/zapato_model.dart';
// import 'package:shoes_app/src/pages/zapatos_desc_page.dart';
import 'package:shoes_app/src/pages/zapatos_pages.dart';
 
void main(){
 return  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(_)=>new ZapatoModel() ,)

    ],
      
  child:MyApp()
  ),

  
  );
} 
 
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