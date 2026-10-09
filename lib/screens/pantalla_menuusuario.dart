
import 'package:flutter/material.dart';
import 'package:frontend/screens/eventos/pantalla_evento.dart';
// Importaciones de tus pantallas
import 'pantalla_registro.dart';
import 'inventario-partituras/inventario_partituras.dart';
import 'inventario-instrumentos/inventario_instrumentos.dart';

class MenuUsuario extends StatelessWidget {
  const MenuUsuario({super.key});

  Widget opcionMenu(BuildContext context, String texto, Widget? pantalla) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: const Icon(Icons.music_note, color: Colors.white, size: 28),
      title: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          letterSpacing: 0.5,
        ),
      ),
      onTap: () {
        final navegador = Navigator.of(context);
        navegador.pop(); // cierra el menú
        if (pantalla != null) {
          navegador.push(
            MaterialPageRoute(builder: (context) => pantalla),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // se ve el inicio atrás
      body: Stack(
        children: [
          // CAPA 1: cubre toda la pantalla, al tocarla se cierra el menú
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
            ),
          ),

          // CAPA 2: el cuadro oscuro con las opciones (encima de la capa 1)
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B2B2B).withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    opcionMenu(context, 'Registrar Integrante', const PantallaRegistro()),
                    opcionMenu(context, 'Inventario- Instrumentos', const InventarioInstrumentos()),
                    opcionMenu(context, 'Inventario- Partituras', const InventarioPartituras()),
                    opcionMenu(context, 'Multimedia', null),
                    opcionMenu(context, 'Eventos', const PantallaEventos()),
                    opcionMenu(context, 'Perfil', null),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}