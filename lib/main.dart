import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/theme/dark_theme.dart';
import 'package:todo/theme/light_theme.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TodoProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title                      : 'Todo App',
      debugShowCheckedModeBanner : false,
      localizationsDelegates     : AppLocalizations.localizationsDelegates,
      supportedLocales           : AppLocalizations.supportedLocales,
      theme                      : LightTheme.lightTheme,
      darkTheme                  : DarkTheme.lightTheme,
      themeMode                  : Provider.of<TodoProvider>(context).themeMode == "light" ? ThemeMode.light : ThemeMode.dark,
      initialRoute               : HomeScreen.routeName,
      routes                     : {
        HomeScreen.routeName     : (context) =>  const HomeScreen()
      },
      
    );
  }
}

