
import 'package:custom_pinter/src/pages/slideshow_page.dart';
import 'package:custom_pinter/src/pages/animaciones_page.dart';
import 'package:custom_pinter/src/pages/emergency_page.dart';
import 'package:custom_pinter/src/pages/graficas_circulares_pages.dart';
import 'package:custom_pinter/src/pages/headers_pages.dart';
import 'package:custom_pinter/src/pages/pinterest_page.dart';
import 'package:custom_pinter/src/pages/slider_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pagesRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'SlidesShow', SlideShowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadrado animado', AnimacionesPage()),
  _Route(FontAwesomeIcons.heading, 'Emcabezado', HeaderPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra de progreso', GraficasCirculares()),
  _Route(FontAwesomeIcons.pinterest, 'Pinteres', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Sliver',SliderListPage()),





];


class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(
    this.icon, 
    this.titulo, 
    this.page);
  
}