import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  Slideshow({
   @required this.slides,
   this.puntosArriba=false, 
   this.colorPrimario    = Colors.blue,
   this.colorSecundario  = Colors.grey, 
   this.bulletPrimario=12, 
   this.bulletSecundario=12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> new _SlidershowModel(),
      child: SafeArea(
              child: Center(
            child:Builder(
              builder:(BuildContext context){
                Provider.of<_SlidershowModel>(context).colorPrimario= this.colorPrimario;
                Provider.of<_SlidershowModel>(context).colorSecundario= this.colorSecundario;
                Provider.of<_SlidershowModel>(context).bulletPrimario= this.bulletPrimario;
                Provider.of<_SlidershowModel>(context).bulletSecundario= this.bulletSecundario;
                return _CrearEstructuraSlideshow(puntosArriba: puntosArriba, slides: slides);
              } ,
            )
            ),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({

    @required this.puntosArriba,
    @required this.slides,
  });

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if(this.puntosArriba)_Dots(
          this.slides.length, 
          
          ),
      Expanded(
       
        child: _Slides(this.slides)
        ),
        if(!this.puntosArriba)_Dots(
          this.slides.length,
        
          )
       
      ],

    );
  }
}

class _Dots extends StatelessWidget {
final int totalSlides;

  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: <Widget>[
        //   _Dot(0),
        //    _Dot(1),
        //     _Dot(2)
        // ],

        children: List.generate(this.totalSlides,(i)=>_Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
final int index;

_Dot(this.index);
 
  @override
  Widget build(BuildContext context) {

    // final pageViewIndex= Provider.of<_SlidershowModel>(context).currentPage;
    final ssModel= Provider.of<_SlidershowModel>(context);
    double tamano = 0;
    Color  color;

    if(ssModel._currentPage>=index-0.5&&ssModel._currentPage<index+0.5){
      tamano= ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
      }else{
        tamano = ssModel.bulletSecundario;
        color = ssModel.colorSecundario;
      }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width:tamano,
      height:tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color:color,
        shape: BoxShape.circle
      ),
    );
  }
}






// 
class _Slides extends StatefulWidget {

final List<Widget> slides;

 _Slides(this.slides) ;

  @override
  _SlidesState createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

final pageViewControler = new PageController();

@override
  void initState() {    
  super.initState();
  pageViewControler.addListener((){

    // actualizar provider
    Provider.of<_SlidershowModel>(context, listen: false).currentPage = pageViewControler.page;

  });



  }



@override

  void dispose() {
    pageViewControler.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
          controller: pageViewControler,
                //           children: <Widget>[
                // _Slide('assets/foto-1.svg'),
                // _Slide('assets/foto-2.svg'),
                // _Slide('assets/foto-3.svg'),

                //           ],
      children:widget.slides.map((slide)=>_Slide(slide)).toList(),
        ),
    );
  }
}

class _Slide extends StatelessWidget {
final Widget slide;
_Slide(this.slide);
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),    
      child: slide
      );    
  }
}




class _SlidershowModel with ChangeNotifier{

  double _currentPage      = 0;
  Color  _colorPrimario    = Colors.blueAccent;
  Color  _colorSecundario  = Colors.grey;
  double _bulletPrimario   = 12; 
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;
  set currentPage (double currentPage){
    this._currentPage = currentPage;

    // print(currentPage);
    notifyListeners();
  }
  Color get colorPrimario =>this._colorPrimario;
  set colorPrimario(Color color){
    this._colorPrimario=color;
      
  }
  Color get colorSecundario =>this._colorSecundario;
  set colorSecundario(Color color){
    this._colorSecundario=color;
  }
  double get bulletPrimario =>this._bulletPrimario;
  set bulletPrimario(double bullet){
    this._bulletPrimario=bullet;
  }
  double get bulletSecundario =>this._bulletSecundario;
  set bulletSecundario(double bullet){
    this._bulletSecundario=bullet;
  }

}