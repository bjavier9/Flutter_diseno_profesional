import 'package:custom_pinter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCirculares extends StatefulWidget {
  @override
  _GraficasCircularesState createState() => _GraficasCircularesState();
}

class _GraficasCircularesState extends State<GraficasCirculares> {
 double porcentaje =0.0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje+=10;
          if(porcentaje>100){
            porcentaje=0;
          }
          });
          
        },
      ),
      body: Center( 
        child: Container(
          width: 300,
          height: 300,
          // color: Colors.redAccent,
          child: RadialProgress(porcentaje:porcentaje, colorPrimario: Colors.brown,),
        ),

      ),
    );
  }
}