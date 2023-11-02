import 'package:indumentariastock/domain/datasources/items_datasource.dart';
import 'package:indumentariastock/domain/entities/item.dart';
import 'package:indumentariastock/domain/repositories/ItemsRepository.dart';

class ItemRepositoryImpl extends ItemsRepository{
  final ItemsDatasource datasource;
  ItemRepositoryImpl(this.datasource);

  @override
  Future<List<ItemStock>> getAllItems() {
    return datasource.getAllItems();
  }

  @override
  Future<void> addItem(ItemStock item) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<void> removeItem(ItemStock item) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }
}