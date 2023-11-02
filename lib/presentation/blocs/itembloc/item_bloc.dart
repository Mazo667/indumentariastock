import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indumentariastock/domain/entities/item.dart';

import '../../../domain/repositories/ItemsRepository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {

  ItemBloc(ItemState initialState) : super(initialState) {

    on<ItemAdd>((event, emit)  {


    });

    on<ItemRemove>((event, emit) {

    });


  }
}
