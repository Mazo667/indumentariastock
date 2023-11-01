import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indumentariastock/config/theme/app_theme.dart';
import 'package:indumentariastock/presentation/blocs/theme/theme_bloc.dart';

class ThemeChangerScreen extends StatelessWidget {

  static const name = 'theme_changer';
  const ThemeChangerScreen({super.key});



  @override
  Widget build(BuildContext context) {

    final bool isDarkMode = context.watch<ThemeBloc>().state.appTheme.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("App Theme Changer"),
        actions: [
          IconButton(onPressed: () {
            var themeBloc = context.read<ThemeBloc>();
            print('$isDarkMode');
            themeBloc.add(ToggleDarkMode(isDarkMode: !isDarkMode));
          },
            icon: Icon(isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode)

          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends StatelessWidget {
  const _ThemeChangerView({super.key});

  @override
  Widget build(BuildContext context) {

    final int selectecColor = context.watch<ThemeBloc>().state.appTheme.selectedColor;

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final Color color = colorList[index];
        return RadioListTile(
          title: Row(
            children: [
              Text("Este color",style: TextStyle(color: color)),
              const SizedBox(width: 5),
              Icon(Icons.color_lens,color: color)
            ],
          ),
          hoverColor: color,
          value: index,
          groupValue: selectecColor,
          onChanged: (value) {
           final themeBloc = context.read<ThemeBloc>();
           themeBloc.add(ChangeColor(selectedColor: value!));
          });
      },
    );
  }
}