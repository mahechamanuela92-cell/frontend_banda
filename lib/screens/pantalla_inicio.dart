import 'package:flutter/material.dart';
import 'package:frontend/screens/pantalla_menuusuario.dart';
import 'package:frontend/themes/colores.dart';
import 'package:frontend/widgets/inicio_pantallas/contactenos_pantalla.dart';
import 'package:frontend/widgets/inicio_pantallas/instrumentos_pantallas.dart';
import 'package:frontend/widgets/inicio_pantallas/nuestra_historia_pantalla.dart';
import '../widgets/fondos.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración de las tarjetas principales
    final tarjetas = [
      {'titulo': 'NUESTRA HISTORIA', 'img': 'assets/images/libro.png', 'der': false},
      {'titulo': 'INSTRUMENTOS CON LOS QUE CONTAMOS', 'img': 'assets/images/instrumentos.png', 'der': true},
      {'titulo': 'CONTÁCTENOS', 'img': 'assets/images/contacto.png', 'der': false},
    ];

    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          "assets/images/fondo_login1.png",
                          fit: BoxFit.contain,
                          height: 230,
                        ),
                      ),
                    ),
                    Text(
                      "BANDA SINFONICA MUNICIPAL DE GARZÓN", 
                      style: TextStyle(fontSize: 20, color: Colores.colorLetra1, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Renderizado dinámico de las tarjetas con navegación completa
                    ...tarjetas.map((t) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _crearTarjeta(
                        titulo: t['titulo'] as String,
                        rutaImagen: t['img'] as String,
                        imagenALaDerecha: t['der'] as bool,
                        onTap: () {
                          final titulo = t['titulo'] as String;

                          // 2. Evaluamos cuál tarjeta se presionó para redirigir a su respectiva pantalla
                          if (titulo == 'NUESTRA HISTORIA') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NuestraHistoriaPantalla(),
                              ),
                            );
                          } else if (titulo == 'INSTRUMENTOS CON LOS QUE CONTAMOS') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InstrumentosPantalla(),
                              ),
                            );
                          } else if (titulo == 'CONTÁCTENOS') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContactenosPantalla(),
                              ),
                            );
                          }
                        },
                      ),
                    )),

                    const SizedBox(height: 4),
                  ],
                ),
              ),

              // Botones superiores (Menú y Usuario)
              Positioned(
                top: 10,
                left: 12,
                child: Column(
                  children: [
                    _buildBotonIcono(
                      img: 'assets/images/menu-principal.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuUsuario(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Helper para los botones circulares superiores
Widget _buildBotonIcono({required String img, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(img, width: 42, height: 42, fit: BoxFit.contain),
  );
}

Widget _crearTarjeta({
  required String titulo,
  required String rutaImagen,
  required bool imagenALaDerecha,
  required VoidCallback onTap,
}) {
  final imgWidget = Image.asset(rutaImagen, height: 65, width: 65, fit: BoxFit.contain);

  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF98DDD6),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            if (!imagenALaDerecha) ...[imgWidget, const SizedBox(width: 12)],
            Expanded(
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            if (imagenALaDerecha) ...[const SizedBox(width: 12), imgWidget],
          ],
        ),
      ),
    )
  );
}