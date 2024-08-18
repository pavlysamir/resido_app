import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/features/chat/presentation/views/chat_screen.dart';
import 'package:resido_app/features/home/presentation/views/home_screen.dart';

import '../../features/profile/profile_main/presentation/views/profile_screen.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List screens = [const HomeScreen(), const ChatScreen(), ProfileScreen()];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(HomeChaneNavBar());
  }
}
