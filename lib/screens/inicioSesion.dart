import 'package:frontend/screens/pantalla_inicio.dart';
import 'package:flutter/material.dart';
import '../widgets/fondos.dart';

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20), 
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        "assets/images/fondo_login1.png",
                        fit: BoxFit.contain,
                        height: 160, 
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'INICIAR SESIÓN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 226, 188, 101),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // --- CAMPO NOMBRE ---
                  _crearCampoTexto(
                    hintText: 'Nombre',
                    icon: Icons.people,
                  ),

                  const SizedBox(height: 16),

                  // --- CAMPO CORREO ---
                  _crearCampoTexto(
                    hintText: 'Correo',
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16),

                  // --- CAMPO CONTRASEÑA ---
                  _crearCampoTexto(
                    hintText: 'Contraseña',
                    icon: Icons.vpn_key,
                    obscureText: true,
                  ),

                  const SizedBox(height: 30),

                // --- BOTÓN INICIAR SESIÓN ---
                  SizedBox(
                    width: 210,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Inicio()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7CB8B4), // Color turquesa claro
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'INICIAR SESION',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 110),

                  // --- TEXTO INFERIOR ---
                  const Text(
                    'BANDA SINFONICA SAN MIGUEL DE GARZÓN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE2BC65), // Dorado/Amarillo
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Método reutilizable para los inputs de texto
  Widget _crearCampoTexto({
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF7CB8B4), 
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black,
            size: 26,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}