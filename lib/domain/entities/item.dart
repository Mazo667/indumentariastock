import 'package:flutter/material.dart';

class ItemStock {
  final String nombre;
  final Icon icon;
  final double precio;
  final int cantidad;
  final String? categoria;

  ItemStock({required this.nombre, required this.icon, required this.precio, required this.cantidad, required this.categoria});

}