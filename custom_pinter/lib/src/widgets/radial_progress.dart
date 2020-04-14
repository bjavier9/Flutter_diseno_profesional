import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  const RadialProgress({@required this.porcentaje, 
  this.colorPrimario=Colors.blue, 
  this.colorSecundario=Colors.grey, 
  this.grosorSecundario=4.0,
   this.grosorPrimario=10.0

  });
  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>with SingleTickerProviderStateMixin {
AnimationController controller;
double porcentajeAterior;

@override
  void initState() {
porcentajeAterior = widget.porcentaje;
controller = new AnimationController(vsync: this, duration:Duration(milliseconds: 800) );




    super.initState();
  }


@override
  void dispose() {
   controller.dispose();
    super.dispose();
  }













  @override
  Widget build(BuildContext context) {
    controller.forward(from:0.0);
    final diferenciaAnimar = widget.porcentaje-porcentajeAterior;
    porcentajeAterior=widget.porcentaje;
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
       return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _MiRadialProgress((widget.porcentaje-diferenciaAnimar)+(diferenciaAnimar*controller.value)
          ,widget.colorPrimario
          ,widget.colorSecundario,
          widget.grosorPrimario,
          widget.grosorSecundario,
          
          ),
        ),
      );
      },
    );



      
  }
}

class _MiRadialProgress extends CustomPainter {

  final porcentaje;
  final Color colorprimario;
  final Color colorsecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  _MiRadialProgress( this.porcentaje, this.colorprimario, this.colorsecundario, this.grosorSecundario, this.grosorPrimario);

  
  @override
  void paint(Canvas canvas, Size size) {

    

    // Circulo completado    
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color       = colorsecundario
      ..style       = PaintingStyle.stroke;

    final center = new Offset( size.width * 0.5 , size.height / 2 );
    final radio  = min( size.width * 0.5, size.height * 0.5 );

    canvas.drawCircle(center, radio, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..color       = colorprimario
      ..style       = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * ( porcentaje / 100 );
    canvas.drawArc(
      Rect.fromCircle( center: center, radius: radio ), 
      -pi / 2,
      arcAngle, 
      false, 
      paintArco );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}