import 'package:flutter/material.dart';
import 'package:frontend/screens/inventario-instrumentos/inventario_instrumentos.dart';
import 'package:frontend/screens/inventario-partituras/inventario_partituras.dart';
import 'package:frontend/screens/multimedia/multimedia.dart';
import 'package:frontend/screens/pantalla_registro.dart';

class MenuUsuario extends StatelessWidget {
  const MenuUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      width: 300,
      child: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 8, left: 8),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: [
                _item(context, 'Registrar Integrante',
                    const PantallaRegistro()),
                _item(context, 'Inventario- Instrumentos',
                    const InventarioInstrumentos()),
                _item(context, 'Inventario- Partituras',
                    const InventarioPartituras()),
                _item(context, 'Multimedia', 
                    const MultimediaPantalla()),
                _item(context, 'Eventos', null),
                _item(context, 'Perfil', null),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(BuildContext context, String texto, Widget? destino) {
    return ListTile(
      leading: const Icon(Icons.music_note, color: Colors.white),
      title: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: const SizedBox(width: 24),
      onTap: () {
        Navigator.pop(context); // Cierra el Drawer

        if (destino != null) {
          // Ejecuta la navegación justo después de cerrar el Drawer
          Future.microtask(() {
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destino),
              );
            }
          });
        }
      },
    );
  }
}