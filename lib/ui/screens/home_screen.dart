import 'package:engenharia_de_software/ui/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

// Importa TODAS as telas de destino e o widget do drawer
import 'definirRota_screen.dart';
import 'checkIn_screen.dart';
import 'listaFrequencia_screen.dart'; // Tela da LISTA
import 'frequenciaDia_screen.dart'; // Tela de SELEÇÃO DE ITINERÁRIO

class HomeScreen extends StatelessWidget {
  final String nomeUsuario;

  const HomeScreen({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF424242),
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Painel de Controle'),
        backgroundColor: const Color(0xFF303030),
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Text(
                nomeUsuario.isNotEmpty
                    ? nomeUsuario.substring(0, 1).toUpperCase()
                    : 'U',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF303030),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem-vindo(a), $nomeUsuario!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
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
                      // ===== CORRIGIDO: Apontando para a tela da LISTA =====
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListaFrequenciaScreen(),
                        ),
                      );
                    },
                  ),
                  _buildMenuButton(
                    context,
                    icon: Icons.today,
                    label: 'Frequência do Dia',
                    onTap: () {
                      // ===== CORRIGIDO: Apontando para a tela de SELEÇÃO DE ITINERÁRIO =====
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FrequenciaDoDiaScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          color: const Color(0xFF303030),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white70),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}