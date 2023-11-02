import 'package:indumentariastock/domain/entities/item.dart';

class Category{
  final String nameCategory;
  final List<ItemStock> items;

  Category({required this.nameCategory, required this.items});
}