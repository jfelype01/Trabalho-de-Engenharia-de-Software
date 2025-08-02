// lib/signup_screen.dart

import 'package:flutter/material.dart';
// 1. Importa o pacote da máscara
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  // 2. Adiciona o controller para o CPF
  final _cpfController = TextEditingController();

  // 3. Cria a máscara para o CPF
  final maskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  bool _senhaVisivel = false;
  bool _confirmarSenhaVisivel = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    // 4. Limpa o controller do CPF também
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const inputDecorationTheme = InputDecoration(
      filled: true,
      fillColor: Color(0xFF303030),
      labelStyle: TextStyle(color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide.none,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF424242),
      appBar: AppBar(
        title: const Text('Criar Conta'),
        backgroundColor: const Color(0xFF303030),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Preencha os dados para se cadastrar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _nomeController,
                style: const TextStyle(color: Colors.white),
                decoration: inputDecorationTheme.copyWith(
                  labelText: 'Nome Completo',
                  prefixIcon: Icon(Icons.person_outline, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 16),

              // ================= NOVO CAMPO DE CPF =================
              TextFormField(
                controller: _cpfController,
                style: const TextStyle(color: Colors.white),
                decoration: inputDecorationTheme.copyWith(
                  labelText: 'CPF',
                  prefixIcon: Icon(Icons.badge_outlined, color: Colors.white70),
                ),
                keyboardType: TextInputType.number,
                // Aplica a máscara de formatação
                inputFormatters: [maskFormatter],
              ),

              // ======================================================
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecorationTheme.copyWith(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _senhaController,
                style: const TextStyle(color: Colors.white),
                obscureText: !_senhaVisivel,
                decoration: inputDecorationTheme.copyWith(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white70,
                    ),
                    onPressed: () =>
                        setState(() => _senhaVisivel = !_senhaVisivel),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmarSenhaController,
                style: const TextStyle(color: Colors.white),
                obscureText: !_confirmarSenhaVisivel,
                decoration: inputDecorationTheme.copyWith(
                  labelText: 'Confirmar Senha',
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _confirmarSenhaVisivel
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white70,
                    ),
                    onPressed: () => setState(
                      () => _confirmarSenhaVisivel = !_confirmarSenhaVisivel,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_senhaController.text == _confirmarSenhaController.text) {
                    print('Cadastro Pressionado!');
                    print('Nome: ${_nomeController.text}');
                    // 5. Imprime o CPF para verificar se está funcionando
                    print('CPF: ${_cpfController.text}');
                    print('Email: ${_emailController.text}');
                    print('Senha: ${_senhaController.text}');
                  } else {
                    print('As senhas não coincidem!');
                  }
                },
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
