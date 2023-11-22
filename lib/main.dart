import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app/Core/Network/Api/dio.dart';
import 'package:shop_app/Core/Server/server_locator.dart';
import 'package:shop_app/Core/Shared%20Preferences/shared_prefrences.dart';
import 'package:shop_app/Features/Home/Presentation/Screens/Home/home_screen.dart';
import 'package:shop_app/generated/I10n.dart';

void main() async{
  await MyDio.init();
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
          locale: Locale(MyShared.getCurrentLanguage()),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates:const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: ThemeData(
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
