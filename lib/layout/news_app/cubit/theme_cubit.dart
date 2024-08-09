
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layout/news_app/cubit/theme_states.dart';

class ThemeCubit extends Cubit<ThemeStates>
{
  ThemeCubit():super(InitialAppModeState());

  static ThemeCubit get(context)
  {
    return BlocProvider.of(context);
  }

  bool isDark = false;

  void ChangeModeTheme()
  {
    isDark=!isDark;
    emit(NewsAppModeState());
  }
}