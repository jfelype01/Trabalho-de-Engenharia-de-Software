import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Usaremos para formatar a hora

// 1. O MODELO DE DADOS: Define como é um registro de frequência.
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
  // 2. OS DADOS FICTÍCIOS (MOCK DATA): Simula o que viria do servidor.
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
          // Adiciona um contador de presentes na AppBar
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
      // 3. A CONSTRUÇÃO DA LISTA: ListView.builder é eficiente para listas.
      body: ListView.builder(
        itemCount: mockRegistros.length, // O tamanho da lista
        itemBuilder: (BuildContext context, int index) {
          // Pega o registro atual da lista
          final registro = mockRegistros[index];
          // Formata a hora para exibição
          final formattedTime = DateFormat(
            'HH:mm',
          ).format(registro.checkInTime);

          // 4. A APARÊNCIA DO ITEM: Um Card para cada aluno.
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
                  registro.nome.substring(0, 1), // A inicial do nome
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
