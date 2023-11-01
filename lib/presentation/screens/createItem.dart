import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indumentariastock/domain/entities/item.dart';
import 'package:indumentariastock/presentation/blocs/itembloc/item_bloc.dart';

class CreateItemScreen extends StatefulWidget {
   CreateItemScreen({super.key});

  static const name = 'create_item_screen';

  @override
  State<CreateItemScreen> createState() => _CreateItemScreenState();
}

class _CreateItemScreenState extends State<CreateItemScreen> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

  List<XFile>? _mediaFileList;
  XFile? pickedFile;
  final ImagePicker _picker = ImagePicker();

   // Función de validación que verifica si ambos campos de entrada no están vacíos
  bool _validateFields() {
      if (itemNameController.text.isEmpty || itemPriceController.text.isEmpty) {
        return false; // La validación falla si algún campo está vacío
      }
    return true; // Todos los campos están llenos
  }

  void _setImageFileListFromFile(XFile? value) {
    _mediaFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;

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
                  decoration: const InputDecoration(
                      hintText: 'Nombre del producto'
                  ),
                ),
                const SizedBox(height: 20),
                Text("Introuduce el precio del producto",style: textTheme.headlineMedium),
                TextField(
                  controller: itemPriceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                  decoration: const InputDecoration(
                    hintText: 'Precio del producto',
                  ),
                ),
                const SizedBox(height: 20),
                Text("Elige la foto del producto",style: textTheme.headlineMedium),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () {
                  _onImageButtonPressed(ImageSource.gallery,context: context);
                },
                    child: const Text("Cargar Imagen",style: TextStyle(fontSize: 20))
                ),
                const SizedBox(height: 20),
                pickedFile != null  ? Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: Image.file(File(pickedFile!.path),height: 150,width: 150,fit: BoxFit.fill,))) : const SizedBox(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton.icon(
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
                        icon: const Icon(Icons.playlist_add_check),
                        label: const Text("Finalizar Carga del Producto",style: TextStyle(fontSize: 20)),
                    ),
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

  Future<void> _onImageButtonPressed(ImageSource source, {
        required BuildContext context,}) async {


    // Validar si es una imagen o video (en este caso, se asume imagen)
   // isVideo = false;

    // Llamar al selector de imágenes de la galería o cámara
    pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 100, // Puedes especificar un ancho máximo si lo deseas
      maxHeight: 100, // Puedes especificar una altura máxima si lo deseas
      imageQuality: null, // Puedes especificar la calidad de la imagen
    )!;
    print(pickedFile?.name);
    // Verificar si se seleccionó una imagen
    if (pickedFile != null) {
      // Actualizar la vista con la imagen seleccionada
      setState(() {
        _setImageFileListFromFile(pickedFile);
      });
    } else {
      // Si no se seleccionó una imagen, manejar el error si lo hubiera
      setState(() {
        _pickImageError = 'No se seleccionó una imagen';
      });
    }
  }


}
