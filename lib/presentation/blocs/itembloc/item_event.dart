part of 'item_bloc.dart';

abstract class ItemEvent {
  const ItemEvent();
}


class ItemAdd extends ItemEvent{
  final ItemStock item;

  ItemAdd(this.item);
}

class ItemRemove extends ItemEvent{
  final int index;

  const ItemRemove({required this.index});
}