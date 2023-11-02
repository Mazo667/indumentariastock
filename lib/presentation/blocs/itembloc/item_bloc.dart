import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indumentariastock/domain/entities/item.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc(ItemState initialState) : super(initialState) {

    on<ItemAdd>((event, emit){
      state.items.add(event.item);
      emit(ItemState(state.items));
    });

    on<ItemRemove>((event, emit) {
     state.items.remove(event.item);
     emit(ItemState(state.items));
    });


  }
}
