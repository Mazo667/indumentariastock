import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:indumentariastock/domain/datasources/items_datasource.dart';
import 'package:indumentariastock/domain/entities/item.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ItemDbDatasource extends ItemsDatasource{

  final itemRef = FirebaseFirestore.instance.collection('items')
  .withConverter(fromFirestore: (snapshot,_) => ItemStock.fromJson(snapshot.id,snapshot.data()!)
      //para transformar el item a json
      , toFirestore: (item,_) => item.toJson());


  @override
  Future<List<ItemStock>> getAllItems() async {
    var result = await itemRef.get().then((value) => value);
    List<ItemStock> items = [];
    for(var doc in result.docs){
      items.add(doc.data());
    }
    return Future.value(items);
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