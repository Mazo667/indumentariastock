import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indumentariastock/config/theme/app_theme.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(appTheme: AppTheme())) {

    on<ToggleDarkMode>((event, emit) {
     final apptheme = state.appTheme.copyWith(isDarkMode: event.isDarkMode);
      emit(ThemeState(appTheme: apptheme));
    });

    on<ChangeColor>((event, emit){
      final appTheme = state.appTheme.copyWith(selectedColor: event.selectedColor);
      emit(ThemeState(appTheme: appTheme));
    });

  }
}
