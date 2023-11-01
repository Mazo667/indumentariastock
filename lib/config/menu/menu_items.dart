import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  MenuItem(
      {required this.title,
        required this.subtitle,
        required this.link,
        required this.icon});
}

final appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Crear un producto',
      subtitle: 'Menu para agregar un producto',
      link: '/createItem',
      icon: Icons.add_box_rounded),
  MenuItem(
      title: 'Crear una categoria',
      subtitle: 'Menu para agregar una categoria',
      link: '/',
      icon: Icons.list_rounded),
  MenuItem(
      title: 'Ver empleados',
      subtitle: 'Ver la cantidad de empleados',
      link: '/employees',
      icon: Icons.account_circle),
  MenuItem(
      title: 'Reporte ventas',
      subtitle: 'Grafico que representa la cantidad de ventas',
      link: '/animated',
      icon: Icons.bar_chart),
  MenuItem(
      title: 'Imprimir listado de productos',
      subtitle: 'Imprime o descarga en PDF todos los productos',
      link: '/print',
      icon: Icons.print),
  MenuItem(
      title: 'Colores',
      subtitle: 'Cambiar los colores de la app',
      link: '/theme_changer',
      icon: Icons.screenshot_monitor_outlined),
];