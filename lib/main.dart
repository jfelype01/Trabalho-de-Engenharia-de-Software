import 'package:engenharia_de_software/ui/screens/config_page.dart';
import 'package:engenharia_de_software/ui/screens/main_page.dart';
import 'package:engenharia_de_software/ui/screens/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle Ônibus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainPage(),
    );
  }
}
