import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indumentariastock/infrastructure/datasource/itemsDb_datasource.dart';
import 'package:indumentariastock/presentation/blocs/itembloc/item_bloc.dart';
import '../../../infrastructure/repositories/ItemRepositoryImpl.dart';

final itemsRepositoryBloc = BlocProvider<ItemBloc>(
  create: (context) {
    // Aquí debes instanciar ItemDatasource y proporcionarla al ItemRepositoryImpl
    final itemDatasource = ItemDbDatasource(); // Reemplaza con la instancia real del datasource
    final repository = ItemRepositoryImpl(itemDatasource); // Pasa el datasource al repositorio
    return ItemBloc(
       ItemState([]), // Ajusta el estado inicial según tus necesidades
       repository,
    );
  },
);
