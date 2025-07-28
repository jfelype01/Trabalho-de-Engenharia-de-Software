import 'dart:async';

import 'package:engenharia_de_software/constants/colorsConstants.dart';
import 'package:engenharia_de_software/constants/imagesConstants.dart';
import 'package:engenharia_de_software/ui/screens/landing_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();

  Timer(Duration(seconds: 3), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Landing_Page()),
    );
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        // Substitua pelo caminho da sua imagem
        child: Image.asset(
          AppImages.busIcon,
        ),
      ),
    );
  }
}