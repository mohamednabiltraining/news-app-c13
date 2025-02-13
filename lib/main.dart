import 'package:flutter/material.dart';
import 'package:news_app_c13/api/ApiManager.dart';
import 'package:news_app_c13/core/app_theme.dart';
import 'package:news_app_c13/ui/screens/categories_screen.dart';
import 'package:news_app_c13/ui/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      initialRoute: CategoriesScreen.routeName,
    );
  }
}
