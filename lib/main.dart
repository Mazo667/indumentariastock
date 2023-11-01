import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indumentariastock/config/router/app_router.dart';
import 'package:indumentariastock/presentation/blocs/itembloc/item_bloc.dart';
import 'package:indumentariastock/presentation/blocs/theme/theme_bloc.dart';


void main() {
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
          create: (context) => ItemBloc(),
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
