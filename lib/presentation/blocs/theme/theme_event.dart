part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();
}


class ChangeColor extends ThemeEvent{
  final int selectedColor;

  ChangeColor({required this.selectedColor});
}

class ToggleDarkMode extends ThemeEvent{
  final bool isDarkMode;

  ToggleDarkMode({required this.isDarkMode});
}
