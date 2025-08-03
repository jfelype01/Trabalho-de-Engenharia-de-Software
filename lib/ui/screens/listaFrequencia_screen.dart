// lib/listaFrequencia_screen.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Modelo de dados para um registro
class RegistroFrequencia {
  final String nome;
  final String cpf;
  final DateTime checkInTime;
  final String status;

  RegistroFrequencia({
    required this.nome,
    required this.cpf,
    required this.checkInTime,
    this.status = 'Presente',
  });
}

class ListaFrequenciaScreen extends StatelessWidget {
  // Dados fictícios que simulam o que viria de um banco de dados
  final List<RegistroFrequencia> mockRegistros = [
    RegistroFrequencia(
      nome: 'Maria Eduarda Silva',
      cpf: '111.222.333-44',
      checkInTime: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    RegistroFrequencia(
      nome: 'João Pedro Costa',
      cpf: '222.333.444-55',
      checkInTime: DateTime.now().subtract(const Duration(minutes: 12)),
    ),
    RegistroFrequencia(
      nome: 'Ana Clara Oliveira',
      cpf: '333.444.555-66',
      checkInTime: DateTime.now().subtract(const Duration(minutes: 18)),
    ),
    RegistroFrequencia(
      nome: 'Lucas Martins Souza',
      cpf: '444.555.666-77',
      checkInTime: DateTime.now().subtract(const Duration(minutes: 25)),
    ),
    RegistroFrequencia(
      nome: 'Beatriz Almeida',
      cpf: '555.666.777-88',
      checkInTime: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];

  ListaFrequenciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF424242),
      appBar: AppBar(
        title: const Text('Lista de Frequência'),
        backgroundColor: const Color(0xFF303030),
        foregroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Total: ${mockRegistros.length}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mockRegistros.length,
        itemBuilder: (BuildContext context, int index) {
          final registro = mockRegistros[index];
          final formattedTime = DateFormat(
            'HH:mm',
          ).format(registro.checkInTime);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFF303030),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[700],
                child: Text(
                  registro.nome.substring(0, 1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                registro.nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'CPF: ${registro.cpf}\nCheck-in às $formattedTime',
                style: TextStyle(color: Colors.grey[400]),
              ),
              trailing: Chip(
                label: Text(
                  registro.status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.green[600],
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            ),
          );
        },
      ),
    );
  }
}