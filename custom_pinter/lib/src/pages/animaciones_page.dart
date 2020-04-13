import 'dart:math';

import 'package:flutter/material.dart';


class AnimacionesPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: CuadradoAnimado(),
      )
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
 
 AnimationController controller;
 Animation<double> rotation;
 Animation<double> opacidad;
 Animation<double> moverDerecha;
 Animation<double> agrandar;
 Animation<double> opacidadOut;


 @override
  void initState() {
    controller=new AnimationController(
        vsync: this, 
        duration: Duration(milliseconds: 4000)
    );
    rotation=Tween(begin: 0.0, end: 4*pi)
    .animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut
    ));  
    opacidad= Tween(begin:0.1,end:1.0 ).animate(
      CurvedAnimation(
      parent: controller,
      curve: Interval(0, 0.25, curve: Curves.easeOut)
    ));

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
      parent: controller,
      curve: Interval(0, 0.25, curve: Curves.easeOut)
    ));
    agrandar = Tween(begin: 0.0, end: 2.0).animate(
                CurvedAnimation(
                      parent: controller,
                      curve: Interval(0, 0.25, curve: Curves.easeOut)
                      ));

    opacidadOut= Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.75, 1.0, curve: Curves.easeOut)
                      ));




    controller.addListener((){
      if(controller.status==AnimationStatus.completed){
        // controller.reverse();
        controller.reset();
      }
      // else if(controller.status==AnimationStatus.dismissed){
      //   controller.forward();
      // }

    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
 
 
 
 
  @override
  Widget build(BuildContext context) {
    // reproduccion
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      // child: ,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        
        
        return Transform.translate(
            offset: Offset(moverDerecha.value,0),
            child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacidad.value-opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: child
                ),),
            ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.purpleAccent
      ),
    );
  }
}