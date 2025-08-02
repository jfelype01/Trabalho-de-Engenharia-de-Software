import 'package:engenharia_de_software/ui/screens/account_info_page.dart';
import 'package:engenharia_de_software/ui/screens/config_page.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart'; // Importa a tela de login para o logout

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero remove qualquer preenchimento da ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text(
              'Menu Principal',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Meu Perfil'),
            onTap: () {
              // Lógica para navegar para a tela de perfil
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AccountInfoPage()),
                  );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              // Lógica para navegar para a tela de configurações
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ConfigPage()),
                  );
            },
          ),
          const Divider(), // Uma linha divisória
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              // Lógica de logout que já tínhamos
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
