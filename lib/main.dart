import 'package:app_provider_tutorial/home_page.dart';
import 'package:app_provider_tutorial/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => HomeProvider()..getContacts(),
        child: const HomePage(),
      ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.grey),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}
