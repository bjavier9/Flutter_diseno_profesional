import 'package:custom_pinter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCirculares extends StatefulWidget {
  @override
  _GraficasCircularesState createState() => _GraficasCircularesState();
}

class _GraficasCircularesState extends State<GraficasCirculares> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
       flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Radial Progress",
                style: TextStyle(fontSize: 20.0),
              ),
              new Text(
                "curso",
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
       
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.redAccent,message: 'Success',),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink,message: 'Completado',)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.deepPurple,message: 'full',),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blueAccent,)
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  final String message;
  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color, 
    this.message=''
  });

  final double porcentaje;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      // color: Colors.redAccent,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        grosorPrimario: 4,
        grosorSecundario: 10,
        messages: message,
      ),
    );
  }
}
