import 'package:indumentariastock/domain/entities/item.dart';

abstract class ItemsRepository {
  Future<List<ItemStock>> getAllItems();
  Future<void> addItem(ItemStock item);
  Future<void> removeItem(ItemStock item);
}