

import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderRededondeado extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
     
      decoration: BoxDecoration(
         color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50)
          )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
        // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
   final paint = Paint();
   paint.color=Color(0xff615AAB);
   paint.style=PaintingStyle.fill;
   paint.strokeWidth=20;
   final path = new Path();
   path.moveTo(0, size.height*0.35);
   path.lineTo(size.width,size.height*0.30);
   path.lineTo(size.width,0);
   path.lineTo(0, 0);
    //  path.lineTo(0,size.height*0.5);
   canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }

}
class HeaderTriangular extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
        // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
   final paint = Paint();
   paint.color=Color(0xff615AAB);
   paint.style=PaintingStyle.fill;
   paint.strokeWidth=20;
   final path = new Path();
  //  path.moveTo(0,0);
   path.lineTo(size.width,size.height);
  //  path.lineTo(size.width,0);
   path.lineTo(0, size.height);
      //  path.lineTo(0,size.height*0.5);
   canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}



class HeaderPico extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
        // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
   final paint = Paint();
   paint.color=Color(0xff615AAB);
   paint.style=PaintingStyle.fill;
   paint.strokeWidth=20;
   final path = new Path();
  
  path.lineTo(0,size.height*0.25);
   path.lineTo(size.width*0.5,size.height*0.30);
   path.lineTo(size.width,size.height*0.25);
    path.lineTo(size.width,0);
   canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}




class Headercurvo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
        // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeadercurvoPainter(),
      ),
    );
  }
}

class _HeadercurvoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
   final paint = Paint();
   paint.color=Color(0xff615AAB);
   paint.style=PaintingStyle.fill;
   paint.strokeWidth=20;
   final path = new Path();
  
  path.lineTo(0,size.height*0.25);
  path.quadraticBezierTo(size.width*0.5, size.height*0.40, size.width, size.height*0.25);
  //  path.lineTo(size.width*0.5,size.height*0.30);
   path.lineTo(size.width,0);
  //   path.lineTo(size.width,0);
   canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class Headerwaves extends StatelessWidget {
  final Color color;

 Headerwaves({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
        // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderwavesPainter(this.color),
      ),
    );
  }
}

class _HeaderwavesPainter extends CustomPainter{
final Color color;

  _HeaderwavesPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
   final paint = Paint();
   paint.color=this.color;//Color(0xff615AAB);
   paint.style=PaintingStyle.fill;
   paint.strokeWidth=20;
   final path = new Path();
  
  path.lineTo(0,size.height*0.25);
  path.quadraticBezierTo(size.width*0.25, size.height*0.30, size.width*0.5, size.height*0.25);
  path.quadraticBezierTo(size.width*0.75, size.height*0.20, size.width, size.height*0.25);

  //  path.lineTo(size.width*0.70,size.height*0.9);
   path.lineTo(size.width,0);
    // path.lineTo(size.width,0);
   canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}