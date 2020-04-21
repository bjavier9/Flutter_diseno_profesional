import 'package:flutter/material.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widget/custom_widgets.dart';

class ZapatosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    statusBarDark();
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(
            texto: 'For you',
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Hero(
                      tag: 'zapato-1',
                    child: ZapatosSizePreview()),
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  )
                ],
              ),
            ),
          ),

        AgregarCarritoBoton(monto:180)

        ],
      ),
    );
  }
}
