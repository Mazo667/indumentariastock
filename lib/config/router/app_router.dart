

import 'package:go_router/go_router.dart';
import 'package:indumentariastock/presentation/screens/screens.dart';

final appRouter = GoRouter(
    initialLocation: '/home',
    routes: [

      GoRoute(
          path: '/home',
          name: AllItemsScreen.name,
          builder: (context, state) {
            return AllItemsScreen();
          },
          routes: [

          ]
      ),

      GoRoute(
          path: '/createItem',
        name: CreateItemScreen.name,
        builder: (context, state) {
          return CreateItemScreen();
        },
      ),

      GoRoute(
        path: '/theme_changer',
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