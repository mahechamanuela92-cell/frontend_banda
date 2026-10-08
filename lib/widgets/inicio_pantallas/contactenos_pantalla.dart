import 'package:flutter/material.dart';
import '../fondos.dart';

class ContactenosPantalla extends StatelessWidget {
  const ContactenosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Botón de regresar
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.orange, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 20),

                // Encabezado Contáctenos
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF98E2D6), // Tono pastel claro de tu diseño
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Text(
                    "CONTÁCTENOS",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Contenedor principal con los datos de contacto
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D1E1C).withOpacity(0.92),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: const [
                      // 1. Maestro / Director
                      _ItemContacto(
                        icono: Icons.person_outline,
                        texto: "Sergio Mauricio Vargas Vargas - Maestro",
                      ),
                      SizedBox(height: 18),

                      // 2. Teléfono
                      _ItemContacto(
                        icono: Icons.phone_outlined,
                        texto: "3026042780",
                      ),
                      SizedBox(height: 18),

                      // 3. Correo
                      _ItemContacto(
                        icono: Icons.email_outlined,
                        texto: "uwudanny87@gmail.com",
                      ),
                      SizedBox(height: 18),

                      // 4. Dirección
                      _ItemContacto(
                        icono: Icons.location_on_outlined,
                        texto: "Casa de la cultura",
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Pie de página
                const Center(
                  child: Text(
                    "BANDA SINFÓNICA SAN MIGUEL DE GARZÓN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD3A456),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget reutilizable para las líneas de contacto
class _ItemContacto extends StatelessWidget {
  final IconData icono;
  final String texto;

  const _ItemContacto({
    required this.icono,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icono, color: Colors.white, size: 26),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            texto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}