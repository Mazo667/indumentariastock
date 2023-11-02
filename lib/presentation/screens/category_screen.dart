import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indumentariastock/domain/entities/category.dart';
import 'package:indumentariastock/presentation/widgets/sidemenu/sidemenu.dart';

class CategoryItemScreen extends StatelessWidget {
   CategoryItemScreen({super.key});

  static const name = 'category-item-screen';

  @override
  Widget build(BuildContext context) {
    final pantalones = CategoryItem(nameCategory: 'Pantalones', items: []);
    final remeras = CategoryItem(nameCategory: 'Remeras', items: []);
    final botas = CategoryItem(nameCategory: 'Botas', items: []);
    final musleras =  CategoryItem(nameCategory: 'Museleras', items: []);

    List<CategoryItem> categorias = [pantalones,remeras,botas,musleras];
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text("Categorias"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20
            ) ,
            itemCount: categorias.length + 1,
            itemBuilder:  (context, index) {
              if(index == categorias.length){
                return const _LastItem();
              }
              return CartegoryItemCard(categoryItem: categorias[index],);
            }),
      ),
    );
  }
}

class _LastItem extends StatelessWidget {
  const _LastItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
        border: Border.all(
          color: Colors.black26,
          width: 2
        )
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Agregar una categoria",style: textTheme.displaySmall ),
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.add_box_rounded,size: 50))
      ],
    ),
    );
  }
}




class CartegoryItemCard extends StatelessWidget {
  final CategoryItem categoryItem;
  const CartegoryItemCard({super.key, required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
        border: Border.all(
          color: Colors.black26,
          width: 2
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(categoryItem.nameCategory,style: textTheme.displayMedium),
          Text('Total de items: ${categoryItem.items.length}',style: textTheme.displaySmall)
        ],
      ),
    );
  }
}
