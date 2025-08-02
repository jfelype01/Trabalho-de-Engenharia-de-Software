import 'package:flutter/material.dart';
import 'package:engenharia_de_software/constants/colorsConstants.dart';

enum NotificationPreference {
  all,
  checkinOnly,
  frequencyOnly,
  none,
}

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  NotificationPreference _preference = NotificationPreference.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Preferências de Notificação',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.lightText),
            ),
          ),
          RadioListTile<NotificationPreference>(
            title: const Text('Todas as notificações', style: TextStyle(color: AppColors.lightText)),
            value: NotificationPreference.all,
            groupValue: _preference,
            onChanged: (value) {
              setState(() {
                _preference = value!;
              });
            },
          ),
          RadioListTile<NotificationPreference>(
            title: const Text('Apenas notificações de check-in', style: TextStyle(color: AppColors.lightText)),
            value: NotificationPreference.checkinOnly,
            groupValue: _preference,
            onChanged: (value) {
              setState(() {
                _preference = value!;
              });
            },
          ),
          RadioListTile<NotificationPreference>(
            title: const Text('Apenas notificações de frequência', style: TextStyle(color: AppColors.lightText)),
            value: NotificationPreference.frequencyOnly,
            groupValue: _preference,
            onChanged: (value) {
              setState(() {
                _preference = value!;
              });
            },
          ),
          RadioListTile<NotificationPreference>(
            title: const Text('Não notificar', style: TextStyle(color: AppColors.lightText)),
            value: NotificationPreference.none,
            groupValue: _preference,
            onChanged: (value) {
              setState(() {
                _preference = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
