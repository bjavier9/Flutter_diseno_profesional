import 'package:custom_pinter/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: <Widget>[
          Expanded(child:MySlideShow() ,),
          
          
          
        ],
      )
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 16,
      puntosArriba: false,
      colorPrimario: Colors.redAccent,
      colorSecundario: Colors.purple,
      slides: <Widget>[
        SvgPicture.asset('assets/foto-1.svg'),
        SvgPicture.asset('assets/foto-2.svg'),
        SvgPicture.asset('assets/foto-3.svg'),
        SvgPicture.asset('assets/foto-4.svg'),
        SvgPicture.asset('assets/foto-5.svg')
      ],
    );
  }
}
