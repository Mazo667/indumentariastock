import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChangerScreen extends StatelessWidget {

  static const name = 'theme_changer';
  const ThemeChangerScreen({super.key});



  @override
  Widget build(BuildContext context) {

    //final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("App Theme Changer"),
        actions: [
          IconButton(onPressed: () {
            //ref.read(isDarkModeProvider.notifier).update((state) => !state);
           // ref.read(themeNotifierProvider.notifier).toggleDarkMode();
          },
            //  icon: Icon(isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode)
              icon: Icon( Icons.light_mode_rounded)
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

  //  final List<Color> colors = ref.watch(colorListProvider);
  //  final int selectecColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text('Este color',style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          value: index,
          groupValue: selectecColor,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
            //ref.read(selectedColorProvider.notifier).state = index;
          },);
      },
    );
  }
}