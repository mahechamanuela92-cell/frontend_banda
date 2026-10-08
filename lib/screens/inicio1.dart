import 'package:frontend/screens/inicioSesion.dart';
import 'package:frontend/themes/colores.dart';
import 'package:flutter/material.dart';
import '../widgets/fondos.dart';

class Inicio1 extends StatelessWidget {
  const Inicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: Stack(
            children: [
              // Contenido central: Logo y Título centrados en la pantalla
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          "assets/images/fondo_login1.png",
                          fit: BoxFit.contain,
                          height: 230,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "BANDA SINFONICA MUNICIPAL DE GARZÓN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colores.colorLetra1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Botón de usuario en la esquina superior izquierda
              Positioned(
                top: 10,
                left: 12,
                child: _buildBotonIcono(
                  img: 'assets/images/usuario.png',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const InicioSesion()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper para el botón de icono circular
Widget _buildBotonIcono({required String img, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(img, width: 42, height: 42, fit: BoxFit.contain),
  );
}