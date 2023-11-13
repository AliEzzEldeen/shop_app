import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app/Core/Cubits/Main/main_cubit.dart';
import 'package:shop_app/Core/Utils/app_svg.dart';
import 'package:shop_app/Presentation/Screens/Home/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainCubit cubit = MainCubit();
  int _currentIndex = 0;
  List<Widget> listScreens = [
    const MainScreen(),
    const MainScreen(),
    const MainScreen(),
    const MainScreen(),
  ];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
            body: cubit.screens[cubit.index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              unselectedItemColor: Colors.grey.shade600,
              selectedItemColor: Colors.blueGrey,
              type: BottomNavigationBarType.fixed,
              items: [
                const BottomNavigationBarItem(
                  icon: AppSVG(assetName: 'home'),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                    icon: AppSVG(assetName: 'search'), label: 'Search'),
                BottomNavigationBarItem(
                    icon: AppSVG(
                      assetName: 'shipping',
                      width: 6.w,
                      color: Colors.black,
                    ),
                    label: 'Order'),
                const BottomNavigationBarItem(
                    icon: AppSVG(assetName: 'profile'), label: 'Profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}
