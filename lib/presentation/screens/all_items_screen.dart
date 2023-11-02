import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:indumentariastock/domain/entities/item.dart';
import 'package:indumentariastock/presentation/blocs/itembloc/item_bloc.dart';
import 'package:indumentariastock/presentation/widgets/item/itemList.dart';
import 'package:indumentariastock/presentation/widgets/sidemenu/sidemenu.dart';

class AllItemsScreen extends StatefulWidget {
  const AllItemsScreen({super.key});

  static const name = 'home-screen';

  @override
  State<AllItemsScreen> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends State<AllItemsScreen> {
  List<ItemStock> _items = [];
  @override
  void initState() {
    super.initState();
    //_getLastItems();
  }

  void _getAllItems() async {
    var lastItems = await
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
    key: scaffoldKey,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: const Text('Flutter material 3'),
    ),
    body: const _HomeView(),
    drawer: SideMenu(scaffoldKey: scaffoldKey),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => _saveItem(context),
    ),
    );
  }

  _saveItem(BuildContext context) {
    var item = ItemStock(nombre: 'nombre', imagePath: '', precio: 2000.0, cantidad: 0, categoria: 'Pantalones', id: '');
    var itemBloc = context.read<ItemBloc>();
    itemBloc.add(ItemAdd(item));
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc,ItemState>(
        builder: (context, itemState) {
         var emptyListWidget = Center(child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Aun no tienes productos en tu cuenta",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
             TextButton(onPressed: () => context.push('/createItem'),
                 child: const Text("Agregue los productos",style: TextStyle(fontSize: 25))
             )
           ],
         ));

         return itemState.items.isEmpty ? emptyListWidget : MyItemList(items: itemState.items);
        });
  }
}


class MyItemList extends StatelessWidget {
  final List<ItemStock> items;
  const MyItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
         return StockItem( item: items[index]);
        });
  }
}


