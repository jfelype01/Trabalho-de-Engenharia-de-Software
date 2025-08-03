// lib/checkIn_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  // Variável para controlar o estado do check-in
  bool _isCheckedIn = false;

  // Variáveis para o relógio em tempo real
  late DateTime _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Inicializa a hora e configura um timer para atualizar a cada segundo
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    // É essencial cancelar o timer para evitar vazamentos de memória
    _timer.cancel();
    super.dispose();
  }

  // Função chamada quando o botão de check-in é pressionado
  void _handleCheckIn() {
    setState(() {
      _isCheckedIn = true;
    });

    // Exibe o pop-up de confirmação
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sucesso!"),
          content: const Text("Check-in realizado com sucesso!"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o pop-up
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Formata a data e a hora para exibição
    final String formattedDate = DateFormat('dd/MM/yyyy').format(_currentTime);
    final String formattedTime = DateFormat('HH:mm:ss').format(_currentTime);

    return Scaffold(
      backgroundColor: const Color(
        0xFF424242,
      ), // Fundo cinza escuro, como no Figma
      appBar: AppBar(
        title: const Text('Frequência'),
        backgroundColor: const Color.fromARGB(
          255,
          46,
          45,
          45,
        ), // Cinza claro, como no Figma
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // O ÍCONE DO ÔNIBUS FOI REMOVIDO DAQUI

            // Texto do registro do dia
            Text(
              'REGISTRO DO DIA: $formattedDate',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 8),

            // Relógio
            Text(
              formattedTime,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Botão de Check-in Circular
            SizedBox(
              width: 200,
              height: 200,
              child: ElevatedButton(
                // Se _isCheckedIn for true, a função onPressed é null (desativado)
                onPressed: _isCheckedIn ? null : _handleCheckIn,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  // A cor do botão muda com base no estado _isCheckedIn
                  backgroundColor: _isCheckedIn
                      ? Colors.green
                      : Colors.grey[300],
                  // A cor do conteúdo (ícone/texto) muda
                  foregroundColor: _isCheckedIn ? Colors.white : Colors.black,
                  disabledBackgroundColor:
                      Colors.green[600], // Cor quando desativado
                ),
                child: _isCheckedIn
                    ? const Icon(
                        Icons.check,
                        size: 80,
                      ) // Ícone de check após clicar
                    : const Text(
                        'CHECK-IN',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 40),

            // Texto de instrução
            Text(
              // O texto muda com base no estado _isCheckedIn
              _isCheckedIn
                  ? 'Seu registro de hoje foi concluído!'
                  : 'Aperte o botão acima para registrar\nsua entrada no ônibus',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}