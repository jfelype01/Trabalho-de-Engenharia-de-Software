import 'package:flutter/material.dart';
import 'package:engenharia_de_software/constants/colorsConstants.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Frequência de Hoje (29/06/2025)',
      'time': '10h00',
      'lido': 'false',
      'description':
          'Lembre de registrar qual será o uso seu uso do ônibus no dia de hoje.',
    },
    {
      'title': 'Registro de Ida (29/06/2025)',
      'time': '18h15',
      'lido': 'false',
      'description':
          'Seu ônibus sairá em 5 minutos, lembre de realizar o registro ao embarcar nele',
    },
    {
      'title': 'Registro de Volta (29/06/2025)',
      'time': '21h40',
      'lido': 'false',
      'description':
          'Seu ônibus sairá em 5 minutos, lembre de realizar o registro ao embarcar nele',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filtra notificações não lidas
    final unreadNotifications =
        notifications.where((n) => n['lido'] == 'false').toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Notificações'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Notificações não lidas (${unreadNotifications.length})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightText,
                ),
              ),
            ),
            ...unreadNotifications.map(
              (notification) => Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600),
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            notification['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.lightText,
                            ),
                          ),
                        ),
                        Text(
                          notification['time']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.lightText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification['description']!,
                      style: const TextStyle(
                        color: AppColors.lightText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          notification['lido'] = 'true';
                        });
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.remove_red_eye,
                            size: 16,
                            color: AppColors.backgroundSideBar,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Marcar como lida',
                            style: TextStyle(
                              color: AppColors.lightText,
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
