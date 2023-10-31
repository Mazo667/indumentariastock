import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:indumentariastock/domain/entities/item.dart';
import 'package:indumentariastock/presentation/blocs/itembloc/item_bloc.dart';

class CreateItemScreen extends StatelessWidget {
   CreateItemScreen({super.key});

  static const name = 'create_item_screen';

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

   // Función de validación que verifica si ambos campos de entrada no están vacíos
  bool _validateFields() {
      if (itemNameController.text.isEmpty || itemPriceController.text.isEmpty) {
        return false; // La validación falla si algún campo está vacío
      }
    return true; // Todos los campos están llenos
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: size.width * 0.60,
          height: size.height * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(10, 10, 10, 0.02)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Introuduce el nombre del producto",style: textTheme.headlineMedium),
                TextField(
                  controller: itemNameController,
                  decoration: InputDecoration(
                      hintText: 'Nombre del producto'
                  ),
                ),
                const SizedBox(height: 20),
                Text("Introuduce el precio del producto",style: textTheme.headlineMedium),
                TextField(
                  controller: itemPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Precio del producto',
                  ),
                ),
                const SizedBox(height: 20),
                Text("Elige la foto del producto",style: textTheme.headlineMedium),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () {
                  //TODO IMPLEMENTAR CARGA DE FOTO
                }, child: const Text("Cargar Imagen",style: TextStyle(fontSize: 20))),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if(_validateFields()){
                            final price = double.tryParse(itemPriceController.text);
                            _saveItem(context, itemNameController.text, price!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 3),
                                    content: Text("Por favor complete todos los campos")));
                          }
                        },
                        child: const Text("Finalizar Carga del Producto",style: TextStyle(fontSize: 20))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _saveItem(BuildContext context,String name, double price) {
    var item = ItemStock(nombre: name, icon:  const Icon(Icons.account_box_rounded,size: 40), precio: price);
    var itemBloc = context.read<ItemBloc>();
    itemBloc.add(ItemAdd(item));
    context.pop();
  }
}
