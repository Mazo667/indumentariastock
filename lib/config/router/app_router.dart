

import 'package:go_router/go_router.dart';
import 'package:indumentariastock/presentation/screens/createItem.dart';
import 'package:indumentariastock/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
    initialLocation: '/home/0',
    routes: [

      GoRoute(
          path: '/home/:page',
          name: HomeScreen.name,
          builder: (context, state) {

            final pageIndex = int.parse( state.pathParameters['page'] ?? '0' );

            return HomeScreen();
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
        path: '/',
        redirect: ( _ , __ ) => '/home/0',
      ),

    ]
);