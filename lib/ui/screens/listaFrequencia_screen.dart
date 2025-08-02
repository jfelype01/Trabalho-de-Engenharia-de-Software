import 'package:flutter/material.dart';

class ListaFrequenciaScreen extends StatelessWidget {
  const ListaFrequenciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Frequência'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Página da Lista de Frequência',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
