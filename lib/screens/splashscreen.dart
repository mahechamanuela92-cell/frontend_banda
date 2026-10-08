import 'dart:async';
import 'package:frontend/screens/inicio1.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/fondos.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Inicio1()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoBase(
        child: Center(
          child: Image.asset(
            "assets/images/fondo_login1.png",
            height: 230, 
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}