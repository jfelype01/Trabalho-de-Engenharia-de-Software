// lib/main.dart

import 'package:engenharia_de_software/ui/screens/start_page.dart';
import 'package:flutter/material.dart';
import 'ui/screens/login_screen.dart'; // Importa a tela de login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Login',
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      // RESTAURADO: A tela inicial do seu app é a LoginScreen
      home: const StartPage(),
    );
  }
}
