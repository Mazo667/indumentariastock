import 'package:flutter/material.dart';
import 'package:indumentariastock/config/helpers/human_formats.dart';
import 'package:indumentariastock/domain/entities/item.dart';

class StockItem extends StatelessWidget {
  final ItemStock item;
  const StockItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(10, 10, 10, 0.04)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),

            Center(child: item.icon),
            const SizedBox(width: 15),
            //nombre y precio
            Column(
              children: [
                Text(item.nombre,style: textTheme.titleLarge),
                Text('Precio:  ${PricesFormat.number(item.precio,2)}',style: textTheme.titleMedium),
              ],
            ),
            const Spacer(),


            IconButton(onPressed: () => _removeItem(context), icon: const Icon(Icons.edit,size: 30)),
            IconButton(onPressed: () => _removeItem(context), icon: const Icon(Icons.delete,size: 30)),
          ],

        ),
      ),
    );
  }

  _removeItem(BuildContext context) {}
}