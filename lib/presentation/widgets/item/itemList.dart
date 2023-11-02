import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      child: InkWell(
        onTap: () {
              context.push('/all-items/modify-item${item.id}',extra: item);
            },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.black12,
              ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),

              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(item.imagePath)),
              const SizedBox(width: 15),
              //nombre y precio
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.nombre,style: textTheme.titleLarge),
                  Text('Precio:  ${PricesFormat.number(item.precio,2)}',style: textTheme.titleMedium),
                ],
              ),
              const Spacer(),


              IconButton(onPressed: () => _removeItem(context), icon: const Icon(Icons.edit,size: 30)),
              IconButton(onPressed: () => _removeItem(context), icon: const Icon(Icons.delete,size: 30)),
              const SizedBox(width: 5),
            ],

          ),
        ),
      ),
    );
  }

  _removeItem(BuildContext context) {}
}