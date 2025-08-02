// lib/login_screen.dart

import 'package:flutter/material.dart';
import 'home_screen.dart'; // Importa a tela de home para a navegação
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Estilo para os campos de texto
    const inputDecorationTheme = InputDecoration(
      filled: true,
      fillColor: Color(0xFF303030),
      labelStyle: TextStyle(color: Colors.white70),
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide.none,
      ),
    );

    return Scaffold(
      // 1. Fundo escuro aplicado
      backgroundColor: const Color(0xFF424242),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2. Ícone com a nova cor
              Icon(
                Icons.directions_bus_filled_rounded,
                size: 80,
                color: Colors.white70,
              ),
              const SizedBox(height: 16),
              // 3. Textos com a nova cor
              const Text(
                'Bem-vindo de volta!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Faça login para continuar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              ),
              const SizedBox(height: 40),

              // 4. Campos de texto com o novo estilo
              TextFormField(
                controller: _emailController,
                style: const TextStyle(
                  color: Colors.white,
                ), // Cor do texto digitado
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecorationTheme.copyWith(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _senhaController,
                style: const TextStyle(
                  color: Colors.white,
                ), // Cor do texto digitado
                obscureText: !_senhaVisivel,
                decoration: inputDecorationTheme.copyWith(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      setState(() {
                        _senhaVisivel = !_senhaVisivel;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // 5. Botão primário com o novo estilo
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.grey[300], // Cor clara para destaque
                  foregroundColor: Colors.black, // Texto escuro para contraste
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  const nomeDoUsuarioLogado = "Maria";
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen(nomeUsuario: nomeDoUsuarioLogado),
                    ),
                  );
                },
                child: const Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              // 6. Botão secundário com o novo estilo
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // Cor do texto
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  );
                },
                child: const Text('Não tem uma conta? Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
