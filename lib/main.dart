import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app/Core/Server/server_locator.dart';
import 'package:shop_app/Presentation/Screens/Home/home_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext , Orientation , ScreenType ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

          ),
          home: HomeScreen(),
        );
      },

    );
  }
}
