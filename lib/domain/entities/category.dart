import 'package:indumentariastock/domain/entities/item.dart';

class CategoryItem{
  final String nameCategory;
  final List<ItemStock> items;

  CategoryItem({required this.nameCategory, required this.items});
}