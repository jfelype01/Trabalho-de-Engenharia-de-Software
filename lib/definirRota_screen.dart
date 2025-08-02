// lib/definirRota_screen.dart

import 'package:flutter/material.dart';

class DefinirRotaScreen extends StatefulWidget {
  const DefinirRotaScreen({super.key});

  @override
  State<DefinirRotaScreen> createState() => _DefinirRotaScreenState();
}

class _DefinirRotaScreenState extends State<DefinirRotaScreen> {
  String? _cidadeSelecionada;
  String? _universidadeSelecionada;
  String? _motoristaSelecionado;

  final List<String> _opcoesCidade = [
    'Viçosa do Ceará',
    'Tianguá',
    'Ubajara',
    'São Benedito',
    'Ibiapina',
    'Carnaubal',
    'Ipu',
  ];
  final List<String> _opcoesUniversidade = [
    'IFCE-Tianguá',
    'IFCE-Ubajara',
    'UNINTA',
    'UniChristus',
  ];
  final List<String> _opcoesMotorista = [
    'Sr. Ronaldo',
    'Sr. Zé',
    'Sr. João',
    'Sr. Sérgio',
  ];

  // Função para o pop-up de SUCESSO
  void _mostrarDialogoDeSucesso() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sucesso!"),
          content: const Text("Sua rota foi salva com sucesso."),
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

  // NOVA FUNÇÃO: Pop-up para ERRO de validação
  void _mostrarDialogoDeErro() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Atenção!"),
          content: const Text(
            "Por favor, selecione todas as opções antes de salvar.",
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
    // Estilo do texto para os rótulos dos campos
    const labelStyle = TextStyle(color: Colors.white, fontSize: 16);

    return Scaffold(
      backgroundColor: const Color(0xFF424242),
      appBar: AppBar(
        title: const Text('Definir Rota'),
        backgroundColor: const Color(0xFF303030),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(Icons.directions_bus, size: 100, color: Colors.white70),
            const SizedBox(height: 32),

            // --- Campo Cidade ---
            const Text('Cidade onde moro:', style: labelStyle),
            const SizedBox(height: 8), // Espaço adicionado
            _buildDropdown(
              value: _cidadeSelecionada,
              hint: 'Selecione sua cidade',
              items: _opcoesCidade,
              onChanged: (val) => setState(() => _cidadeSelecionada = val),
            ),
            const SizedBox(height: 24),

            // --- Campo Universidade ---
            const Text('Universidade em que estudo:', style: labelStyle),
            const SizedBox(height: 8), // Espaço adicionado
            _buildDropdown(
              value: _universidadeSelecionada,
              hint: 'Selecione sua universidade',
              items: _opcoesUniversidade,
              onChanged: (val) =>
                  setState(() => _universidadeSelecionada = val),
            ),
            const SizedBox(height: 24),

            // --- Campo Motorista ---
            const Text('Motorista do meu ônibus:', style: labelStyle),
            const SizedBox(height: 8), // Espaço adicionado
            _buildDropdown(
              value: _motoristaSelecionado,
              hint: 'Selecione seu motorista',
              items: _opcoesMotorista,
              onChanged: (val) => setState(() => _motoristaSelecionado = val),
            ),
            const SizedBox(height: 40),

            // --- Botão Salvar com a NOVA LÓGICA ---
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                // VERIFICA SE TODOS OS CAMPOS FORAM PREENCHIDOS
                if (_cidadeSelecionada != null &&
                    _universidadeSelecionada != null &&
                    _motoristaSelecionado != null) {
                  // Se tudo estiver OK, mostra o diálogo de sucesso
                  print('Salvando dados...');
                  _mostrarDialogoDeSucesso();
                } else {
                  // Se algo faltar, mostra o diálogo de erro
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

  // Widget auxiliar para construir os Dropdowns e evitar repetição de código
  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint, style: TextStyle(color: Colors.grey[400])),
      dropdownColor: const Color(0xFF424242), // Cor do menu que abre
      iconEnabledColor: Colors.white70,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: const Color(0xFF303030), // Fundo escuro para o campo
      ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          // Estilo para o texto das opções
          child: Text(value, style: const TextStyle(color: Colors.white)),
        );
      }).toList(),
    );
  }
}
