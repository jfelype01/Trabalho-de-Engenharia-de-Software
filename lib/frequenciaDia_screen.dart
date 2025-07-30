import 'package:flutter/material.dart';

class FrequenciaDiaScreen extends StatelessWidget {
  const FrequenciaDiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequência do Dia'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Página da Frequência do Dia',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
