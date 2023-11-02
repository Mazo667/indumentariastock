import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indumentariastock/config/router/app_router.dart';
import 'package:indumentariastock/domain/repositories/ItemsRepository.dart';
import 'package:indumentariastock/presentation/blocs/itembloc/item_bloc.dart';
import 'package:indumentariastock/presentation/blocs/theme/theme_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'infrastructure/repositories/ItemRepositoryImpl.dart';




void main() async {
  /*
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   */

  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.read<ThemeBloc>();

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => ItemBloc(ItemState([])),
          child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
              theme: themeBloc.state.appTheme.getTheme()
          ),
        );
      },
    );
  }
}
