import 'package:flutter/material.dart';

// Importa as novas telas e o drawer
import 'definirRota_screen.dart';
import 'checkIn_screen.dart';
import 'listaFrequencia_screen.dart';
import 'frequenciaDia_screen.dart';
import 'widgets/my_drawer.dart'; // Importa o drawer

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Adiciona o drawer ao Scaffold. O ícone de menu aparecerá automaticamente.
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Painel de Controle'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        // O botão de logout foi movido para o MyDrawer, então removemos o 'actions' daqui.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // GridView é ótimo para criar layouts de botões em grade.
        child: GridView.count(
          crossAxisCount: 2, // 2 colunas
          crossAxisSpacing: 16, // Espaçamento horizontal
          mainAxisSpacing: 16, // Espaçamento vertical
          children: <Widget>[
            _buildMenuButton(
              context,
              icon: Icons.route,
              label: 'Definir Rota',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DefinirRotaScreen(),
                  ),
                );
              },
            ),
            _buildMenuButton(
              context,
              icon: Icons.check_circle_outline,
              label: 'Check-in',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckInScreen(),
                  ),
                );
              },
            ),
            _buildMenuButton(
              context,
              icon: Icons.list_alt,
              label: 'Lista de Frequência',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListaFrequenciaScreen(),
                  ),
                );
              },
            ),
            _buildMenuButton(
              context,
              icon: Icons.today,
              label: 'Frequência do Dia',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FrequenciaDiaScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para criar os botões padronizados e evitar repetição de código
  Widget _buildMenuButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blueAccent),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
