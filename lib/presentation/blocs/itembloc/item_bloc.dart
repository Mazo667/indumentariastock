import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indumentariastock/domain/entities/item.dart';

import '../../../domain/repositories/ItemsRepository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemsRepository repository;

  ItemBloc(ItemState initialState, this.repository) : super(initialState) {

    on<ItemAdd>((event, emit) async {
      try{
        await repository.addItem(event.item);
        final updatedItems = await repository.getAllItems();
        emit(ItemState(updatedItems));
      } catch (e){
        print(e.toString());
      }

    });

    on<ItemRemove>((event, emit) async {
      try{
        await repository.removeItem(event.item);
        final updatedItems = await repository.getAllItems();
        emit(ItemState(updatedItems));
      } catch (e){
        print(e.toString());
      }
    });


  }
}
