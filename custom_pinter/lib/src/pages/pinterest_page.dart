import 'package:custom_pinter/src/theme/theme.dart';
import 'package:custom_pinter/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {  
    
    return ChangeNotifierProvider(
          create: (_)=>new _MenuModel(),
          
          child: Scaffold(
        // body:Center(
        //   child: PinterestMenu())
        body: Stack(
          children: <Widget>[          
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

    

  
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final apptheme = Provider.of<ThemeChanger>(context).currentTheme;
    if(widthPantalla>500){
      widthPantalla=widthPantalla-300;
    }
    
    
    
    return Positioned(
      bottom: 30,
      child:Container(
        // color: Colors.red,
        height: 100,
        width: widthPantalla,
        child: Row(
          children: <Widget>[
            Spacer(),
            PinterestMenu(
          items : [
    PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
        print('Ice pie chart');
        }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
        print('Ice search');
        }),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
        print('Ice notification');
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
        print('Ice user circle');
        })
  ],
          mostrar: mostrar,
          backgroundColor: apptheme.scaffoldBackgroundColor,
          activeColor: apptheme.accentColor,
          

          ),
          Spacer()
          ],
        )
      )
      );
  }
}

class PinterestGrid extends StatefulWidget {



  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
final List<int> items = List.generate(200,(i)=>i);
ScrollController controller = new ScrollController();
double scrollAnterior =0;

@override
  void initState() {
   controller.addListener((){
   if(controller.offset>scrollAnterior && controller.offset>150){
Provider.of<_MenuModel>(context, listen: false).mostrar = false;
   }else{
Provider.of<_MenuModel>(context, listen: false).mostrar = true;

   } 
   scrollAnterior=controller.offset;
   });
    super.initState();
  }

@override
  void dispose() {
   controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if(MediaQuery.of(context).size.width > 500){
      count=3;
    }else{
      count=4;
    }


   return new StaggeredGridView.countBuilder(
     controller: controller,
  crossAxisCount: count,
  itemCount: items.length,
  itemBuilder: (BuildContext context, int index) => _PinteresItem(index),
  staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(1, index.isEven ? 1 : 2),
  mainAxisSpacing: 4.0,
  crossAxisSpacing: 4.0,
);
  }
}

class _PinteresItem extends StatelessWidget {
final int index;
_PinteresItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier{
  bool _mostrar = true;
  bool get mostrar => this._mostrar;
  set mostrar(bool valor){
    this._mostrar = valor;
    notifyListeners();
  }
}