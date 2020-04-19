import 'package:custom_pinter/src/theme/theme.dart';
import 'package:custom_pinter/src/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final apptheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
        body: Headerwaves(color: apptheme.accentColor,),
    );
  }
}