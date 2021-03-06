import 'package:custom_pinter/src/theme/theme.dart';
import 'package:custom_pinter/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if(MediaQuery.of(context).size.height > 500){
      isLarge=true;
    }else{
      isLarge=false;
    }


  final children = [
  Expanded(child:MySlideShow()),
   Expanded(child:MySlideShow()),
  ];
    return Scaffold(
      backgroundColor: Colors.white,
      body:(isLarge)
              ?Column(children:children)
              :Row(children:children,)
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apptheme = Provider.of<ThemeChanger>(context);
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 16,
      puntosArriba: false,
      colorPrimario:(apptheme.darkTheme)?apptheme.currentTheme.accentColor:Color(0xffFF5A7E),
      colorSecundario: Colors.grey,
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
