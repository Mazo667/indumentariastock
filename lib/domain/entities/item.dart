import 'package:flutter/material.dart';

class ItemStock {
  final String id;
  final String nombre;
  final String imagePath;
  final double precio;

  ItemStock({required this.id,required this.nombre, required this.imagePath, required this.precio});

    //Metodo para convertir los datos de json a un itemStock
    ItemStock.fromJson(String id,Map<String,dynamic> json):this(
     id: id,
      imagePath: json.containsKey('imageUrl') ? json['imageUrl'] as String : "assets/images/producto-sin-imagen.png",
      nombre:  json['name'] as String,
      precio: json['price'] as double,
    );

  toJson() {}
}
