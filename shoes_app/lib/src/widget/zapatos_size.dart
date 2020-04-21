
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/model/zapato_model.dart';
import 'package:shoes_app/src/pages/zapatos_desc_page.dart';

class ZapatosSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatosSizePreview({
    this.fullScreen = false
    });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          if(!this.fullScreen){
            Navigator.push(context,MaterialPageRoute(
              builder: (BuildContext context)=>ZapatosDescPage()
            ));
          }
        },

          child: Padding(
        padding: EdgeInsets.symmetric(

          horizontal:(this.fullScreen) ?5:30, 
          vertical: (this.fullScreen) ?0:5
          ),
            child: Container(
          width: double.infinity,
          height: (this.fullScreen)?430:450,
          decoration: BoxDecoration(
            color: Color(0xffF8D468),
            borderRadius:
            (!this.fullScreen)? BorderRadius.circular(50)
                              :BorderRadius.only(bottomLeft:Radius.circular(40),
                              bottomRight: Radius.circular(40),
                              topLeft:  Radius.circular(40),
                              topRight:  Radius.circular(40)
                              )
          ),
          child: Column(
            children: <Widget>[
              _ZapatosCoSombra(), 

              if(!this.fullScreen)
              _ZapatoTallas()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5)
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
final double numero;

  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: (){
            final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
            zapatoModel.talla=this.numero;
      },
          child: Container(
        alignment: Alignment.center,
        child: Text('${numero.toString().replaceAll('.0','')}', 
        style:TextStyle(
          color:(this.numero==zapatoModel.talla)?Colors.white :Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold
        ) ,),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color:(this.numero==zapatoModel.talla)?Color(0xffF1A23A):Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(this.numero==zapatoModel.talla)
            BoxShadow(color: Color(0xffF1A23A),blurRadius: 10, offset:Offset(0, 5) )
          ]
        ),
      ),
    );
  }
}

class _ZapatosCoSombra extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50),
          child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra()),
          Image(image: AssetImage(zapatoModel.assetImage),)
        ],
      ),
    );
  }

}

class _ZapatoSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
          child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}