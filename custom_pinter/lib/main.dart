// import 'package:custom_pinter/src/pages/circular_progress.dart';
// import 'package:custom_pinter/src/retos/animated_retos.dart';
import 'package:custom_pinter/src/pages/laucher_tablet_page.dart';
import 'package:custom_pinter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'src/pages/graficas_circulares_pages.dart';
// import 'src/pages/emergency_page.dart';
import 'src/models/layaut_model.dart';
import 'src/pages/laucher_page.dart';
// import 'src/pages/slider_list_page.dart';
// import 'src/pages/pinterest_page.dart';
// import 'src/pages/slideshow_page.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    create: (_)=>new LayautModel(),
      child: ChangeNotifierProvider(
      create: (_)=>new ThemeChanger(2),
      child: MyApp()
      ),
  )
  
  );

 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: appTheme.currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Pointer',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          
         final screenSize = MediaQuery.of(context).size;
         if(screenSize.width>500){
           return LaucherTabletPage();
         }else{
           return LaucherPage();
         } 
          // return Container(
          //   child: LaucherPage(),
          // );
        },
      ),
      // home: LaucherPage(),
    );
  }
}