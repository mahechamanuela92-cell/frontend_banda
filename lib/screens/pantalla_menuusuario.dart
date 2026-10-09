import 'package:flutter/material.dart';
import 'package:frontend/screens/eventos/pantalla_evento.dart';
// Importaciones de tus pantallas
import 'pantalla_registro.dart';
import 'inventario-partituras/inventario_partituras.dart';
import 'inventario-instrumentos/inventario_instrumentos.dart';
class MenuUsuario extends StatelessWidget {
  const MenuUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle estiloTextoMenu = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );

    return Drawer(
      backgroundColor: Colors.black.withValues(alpha: 0.85),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // 1. Registrar Integrante
              ListTile(
                leading: const Icon(Icons.music_note, color: Colors.white),
                title: const Text('Registrar Integrante', style: estiloTextoMenu),
                onTap: () {
                  Navigator.pop(context); // Cierra el menú lateral
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PantallaRegistro(), // Ajusta al nombre exacto de tu clase
                    ),
                  );
                },
              ),
            // 2. Inventario Instrumentos
            ListTile(
              leading: const Icon(Icons.music_note, color: Colors.white),
              title: const Text('Inventario- Instrumentos', style: estiloTextoMenu),
              onTap: () {
                Navigator.pop(context); // Cierra el menú lateral
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InventarioInstrumentos(),
                  ),
                );
              },
            ), 

            // 3. Inventario Partituras
            ListTile(
              leading: const Icon(Icons.music_note, color: Colors.white),
              title: const Text('Inventario- Partituras', style: estiloTextoMenu),
              onTap: () {
                Navigator.pop(context); // Cierra el menú lateral
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InventarioPartituras(),
                  ),
                );
              },
            ), 

              // 4. Multimedia
              ListTile(
                leading: const Icon(Icons.music_note, color: Colors.white),
                title: const Text('Multimedia', style: estiloTextoMenu),
                onTap: () {
                  Navigator.pop(context);
                  // Agrega Navigator.push aquí cuando tengas la pantalla
                },
              ),

              // 5. Eventos
              ListTile(
                leading: const Icon(Icons.music_note, color: Colors.white),
                title: const Text('Eventos', style: estiloTextoMenu),
                onTap: () {
                  Navigator.pop(context);
                      Navigator.push(
                     context,
                 MaterialPageRoute(
                   builder: (context) => const PantallaEventos(),
                 ),
                );
                },
              ),

              // 6. Perfil
              ListTile(
                leading: const Icon(Icons.music_note, color: Colors.white),
                title: const Text('Perfil', style: estiloTextoMenu),
                onTap: () {
                  Navigator.pop(context);
                  // Agrega Navigator.push aquí cuando tengas la pantalla
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}