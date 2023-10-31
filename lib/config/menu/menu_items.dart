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
      link: '/progress',
      icon: Icons.account_circle),
  MenuItem(
      title: 'Animated Container',
      subtitle: 'Stateful Widget animated',
      link: '/animated',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItem(
      title: 'App Tutorial',
      subtitle: 'App tutorial',
      link: '/app_tutorial',
      icon: Icons.add_chart),
  MenuItem(
      title: 'Infinite Scroll & Pull',
      subtitle: 'Listas infinitas y pull to refresh',
      link: '/infinite_scroll',
      icon: Icons.list_alt_outlined),
  MenuItem(
      title: 'SnackBar y Dialogos',
      subtitle: 'Snack Bar y dialogos simples',
      link: '/snackbar',
      icon: Icons.message_outlined),
  MenuItem(
      title: 'UI Controls',
      subtitle: 'UI controles',
      link: '/ui_controls',
      icon: Icons.keyboard_option_key),
  MenuItem(
      title: 'Counter RiverPod',
      subtitle: 'Un contador de RiverPod',
      link: '/counter',
      icon: Icons.plus_one),
  MenuItem(
      title: 'Theme Changer',
      subtitle: 'Cambiar el modo oscuro a claro o viceversa ',
      link: '/theme_changer',
      icon: Icons.dark_mode_rounded),
];