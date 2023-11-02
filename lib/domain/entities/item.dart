import 'package:flutter/material.dart';

class ItemStock {
  final String id;
  final String nombre;
  final String imagePath;
  final double precio;
  final int cantidad;
  final String? categoria;

  ItemStock({required this.id,required this.nombre, required this.imagePath, required this.precio, required this.cantidad, required this.categoria});

    //Metodo para convertir los datos de json a un itemStock
    ItemStock.fromJson(String id,Map<String,dynamic> json):this(
     id: id,
      imagePath: json.containsKey('imageUrl') ? json['imageUrl'] as String : "assets/images/producto-sin-imagen.png",
      categoria: json.containsKey('category') ? json['category'] as String : "producto sin categoria",
      cantidad: json['quantity'] as int,
      nombre:  json['name'] as String,
      precio: json['price'] as double,
    );

  toJson() {}
}
