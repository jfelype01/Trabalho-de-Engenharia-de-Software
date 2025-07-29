import 'package:engenharia_de_software/constants/colorsConstants.dart';
import 'package:engenharia_de_software/constants/imagesConstants.dart';
import 'package:engenharia_de_software/ui/screens/login_page.dart';
import 'package:engenharia_de_software/ui/screens/signup_page.dart';
import 'package:flutter/material.dart';

class Landing_Page extends StatelessWidget {
  const Landing_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.busIcon),
              SizedBox(height: 24),
              SizedBox(
                width: 300, // Define largura do texto
                child: Text(
                  'Bem-vindo ao aplicativo BusOne! Crie uma conta ou, caso já tenha, faça login!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightText,
                  ),
                  textAlign: TextAlign.center, // Centraliza o texto
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: AppColors.darkText,
                  fixedSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: AppColors.darkText,
                  fixedSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupPage()),
                  );
                },
                child: Text(
                  "Cadastro",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
