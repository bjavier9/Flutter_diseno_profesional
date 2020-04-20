import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget{
  final String texto;

  const BotonNaranja({this.texto});
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 150,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.orange
      ),
      child: Text('$texto', style: TextStyle(color: Colors.white),),

    );
    }

}