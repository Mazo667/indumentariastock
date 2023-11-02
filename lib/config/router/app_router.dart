import 'package:go_router/go_router.dart';
import 'package:indumentariastock/domain/entities/item.dart';
import 'package:indumentariastock/presentation/screens/screens.dart';

final appRouter = GoRouter(
    initialLocation: '/home',
    routes: [

      GoRoute(
          path: '/home',
          name: CategoryItemScreen.name,
          builder: (context, state) {
            return CategoryItemScreen();
          },
          routes: [

          ]
      ),
      //Creador de Items
      GoRoute(
          path: '/createItem',
        name: CreateItemScreen.name,
        builder: (context, state) {
          return CreateItemScreen();
        },
      ),
      //Lista de todos los items
      GoRoute(
        path: '/all-items',
        name: AllItemsScreen.name,
        builder: (context, state) {
          return AllItemsScreen();
        },
        routes: [
          GoRoute(
            path: 'modify-item:id',
            name: ModifyItemScreen.name,
            builder: (context, state) {
              final ItemStock item = state.extra as ItemStock;
              return ModifyItemScreen(item: item);
            },

          ),
        ]
      ),
      //Cambiar el tema
      GoRoute(
        path: '/theme-changer',
        name: ThemeChangerScreen.name,
        builder: (context, state) {
          return ThemeChangerScreen();
        },
      ),



      GoRoute(
        path: '/',
        redirect: ( _ , __ ) => '/home',
      ),

    ]
);