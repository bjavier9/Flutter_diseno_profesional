import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton{

  final Function onPressed;
  final IconData icon;

  PinterestButton({
   @required  this.onPressed, 
   @required this.icon
   });
}



class PinterestMenu extends StatelessWidget {
  final bool mostrar;
 PinterestMenu({
   this.mostrar=true
 });

final List<PinterestButton> items = [
  PinterestButton(icon: Icons.pie_chart, onPressed: (){
    print('Ice pie chart');
  }),
  PinterestButton(icon: Icons.search, onPressed: (){
    print('Ice search');
  }),
  PinterestButton(icon: Icons.notifications, onPressed: (){
    print('Ice notification');
  }),
  PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){
    print('Ice user circle');
  })

];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>new _MenuModel(),
            child: AnimatedOpacity(
              opacity: (mostrar)?1:0,
              duration: Duration(milliseconds: 250),
                          child: _PinteresMenuBackground(
        child: _MenuItems(items),
      ),
            ),
    );
  }
}

class _PinteresMenuBackground extends StatelessWidget {
  final Widget child;
  
   _PinteresMenuBackground({
  @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
     width: 250,
     height: 60,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius:BorderRadius.all(Radius.circular(100)),
       boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black38,
          blurRadius: 10,
          spreadRadius: -5
        )
       ]

     ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
 
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i)=>_PinterestMenuButton(i, menuItems[i]))

    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton( this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return 
    GestureDetector(
      onTap:(){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado=index;
        item.onPressed();
      } ,
      behavior: HitTestBehavior.translucent,
          child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado==index)?35:25,
          color:(itemSeleccionado==index)?Colors.black:Colors.blueGrey,
          ),
      ),
    );
  }
}



class _MenuModel with ChangeNotifier{
int _itemSeleccionado = 0;
int get itemSeleccionado => this._itemSeleccionado;
set  itemSeleccionado(int index){
  this._itemSeleccionado = index;
  notifyListeners();
}


}
