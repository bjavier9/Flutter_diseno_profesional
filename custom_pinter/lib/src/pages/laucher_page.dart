import 'package:custom_pinter/src/routes/routes.dart';
import 'package:custom_pinter/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LaucherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('desenos en flutter'),
      ),
      drawer: _MenuPrincipal(),
      body:_ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
final apptheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,i)=>ListTile(
        leading: FaIcon(pagesRoutes[i].icon,
        color: apptheme.accentColor,
        ),
        title: Text(pagesRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right,color: apptheme.accentColor,),
        onTap: (){
         Navigator.push(context,MaterialPageRoute(builder:(BuildContext context)=>(pagesRoutes[i].page)));

        },
      ), 
      separatorBuilder:(context, i )=>Divider(
        color:apptheme.primaryColorLight,
      ), 
      itemCount: pagesRoutes.length,
      
      );
  }
}


class _MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
                child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text('FH',
                  style:TextStyle(fontSize: 50)),
                ),
              ),
            ),
            Expanded(child: _ListaOpciones(),),

            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: appTheme.currentTheme.accentColor,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value:appTheme.darkTheme, 
                activeColor: appTheme.currentTheme.accentColor,
                onChanged:(value){
                  appTheme.darkTheme=value;
                }),
            ),
             SafeArea(
               bottom: true,
               top: false,
               left: false,
               right: false,
                child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: appTheme.currentTheme.accentColor,),
                title: Text('Custom theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                    activeColor: appTheme.currentTheme.accentColor, 
                  onChanged:(value){
                    appTheme.customTheme=value;
                  }),
            ),
             )
        ],
        ),
      ),
    );
  }
}