import 'package:flutter/material.dart';

class DefinirRotaScreen extends StatelessWidget {
  const DefinirRotaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Definir Rota'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Página para Definir Rota', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
