// lib/frequenciaDia_screen.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// 1. Enum para representar as opções de forma segura e legível
enum ItinerarioOption { idaEVolta, apenasIda, apenasVolta, naoVou }

class FrequenciaDoDiaScreen extends StatefulWidget {
  const FrequenciaDoDiaScreen({super.key});

  @override
  State<FrequenciaDoDiaScreen> createState() => _FrequenciaDoDiaScreenState();
}

class _FrequenciaDoDiaScreenState extends State<FrequenciaDoDiaScreen> {
  // 2. Variável de estado para armazenar a opção selecionada
  ItinerarioOption? _selectedOption;

  void _mostrarDialogoDeSucesso() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sucesso!"),
          content: const Text("Sua frequência para hoje foi salva."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDialogoDeErro() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Atenção!"),
          content: const Text(
            "Por favor, selecione uma das opções de itinerário.",
          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFF424242),
      appBar: AppBar(
        title: const Text('Frequência'),
        backgroundColor: const Color(0xFF303030),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Icon(Icons.directions_bus, size: 80, color: Colors.white70),
            const SizedBox(height: 16),
            const Text(
              'Selecionar Itinerário',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Frequência do dia: $formattedDate',
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
            const SizedBox(height: 24),

            // 3. Grupo de RadioListTile para seleção exclusiva
            // Envolvemos em um Theme para estilizar a cor do "radio"
            Theme(
              data: Theme.of(
                context,
              ).copyWith(unselectedWidgetColor: Colors.white70),
              child: Column(
                children: <Widget>[
                  _buildRadioOption(
                    title: 'Ida e Volta',
                    value: ItinerarioOption.idaEVolta,
                  ),
                  _buildRadioOption(
                    title: 'Apenas Ida',
                    value: ItinerarioOption.apenasIda,
                  ),
                  _buildRadioOption(
                    title: 'Apenas Volta',
                    value: ItinerarioOption.apenasVolta,
                  ),
                  _buildRadioOption(
                    title: 'Não vou hoje',
                    value: ItinerarioOption.naoVou,
                  ),
                ],
              ),
            ),
            const Spacer(), // Ocupa o espaço restante, empurrando o botão para baixo
            // Botão Salvar com a lógica de validação
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
                minimumSize: const Size(
                  double.infinity,
                  50,
                ), // Ocupa toda a largura
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (_selectedOption != null) {
                  _mostrarDialogoDeSucesso();
                } else {
                  _mostrarDialogoDeErro();
                }
              },
              child: const Text(
                'SALVAR',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para criar os RadioListTiles e evitar repetição de código
  Widget _buildRadioOption({
    required String title,
    required ItinerarioOption value,
  }) {
    return RadioListTile<ItinerarioOption>(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      value: value,
      groupValue: _selectedOption,
      onChanged: (ItinerarioOption? newValue) {
        setState(() {
          _selectedOption = newValue;
        });
      },
      activeColor: Colors.white,
      contentPadding: EdgeInsets.zero,
    );
  }
}