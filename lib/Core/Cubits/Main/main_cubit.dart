
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/Home/Presentation/Screens/Home/main_screen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());


int index = 0;

List<Widget> screens = [
  const MainScreen(),
  const MainScreen(),
  const MainScreen(),
  const MainScreen()


];

void backToHome() {
  index = 0;
  emit(BackHomeState());
}

void switchToAppointmentScreen() {
  index = 4;
  emit(SwitchToAppointmentScreen());
}


void switchToProfileScreen() {
  index = 3;
  emit(SwitchToProfileScreen());
}
}

