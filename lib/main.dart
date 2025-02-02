import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/screens/home_screen.dart';
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
      theme: ThemeData(
        colorScheme  : ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3 : true,
      ),
      initialRoute   : HomeScreen.routeName,
      routes         : {
        HomeScreen.routeName: (context) => const HomeScreen()
      },
    );
  }
}

