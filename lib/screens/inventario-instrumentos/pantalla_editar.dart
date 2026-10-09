import 'package:flutter/material.dart';
import '../../themes/colores.dart';
import '../../widgets/fondos.dart';

class PantallaEditar extends StatefulWidget {
  final List<String> instrumentos;
  const PantallaEditar({super.key, required this.instrumentos});

  @override
  State<PantallaEditar> createState() => _PantallaEditarState();
}

class _PantallaEditarState extends State<PantallaEditar> {
  final _nombre = TextEditingController();
  late final List<String> _lista = List<String>.from(widget.instrumentos);

  @override
  void dispose() {
    _nombre.dispose();
    super.dispose();
  }

  void _agregar() {
    final texto = _nombre.text.trim();
    if (texto.isEmpty) return;
    setState(() => _lista.add(texto));
    _nombre.clear();
  }

  Future<void> _editar(int i) async {
    final c = TextEditingController(text: _lista[i]);
    final nuevo = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Editar instrumento'),
        content: TextField(controller: c, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, c.text.trim()),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
    c.dispose();
    if (nuevo != null && nuevo.isNotEmpty) setState(() => _lista[i] = nuevo);
  }

  Future<void> _eliminar(int i) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar'),
        content: Text('¿Eliminar "${_lista[i]}" de la lista?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
    if (ok == true) setState(() => _lista.removeAt(i));
  }

  @override
  Widget build(BuildContext context) {
    const blanco18 = TextStyle(color: Colors.white, fontSize: 18);

    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Editar Lista',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                const SizedBox(height: 20),
                const Text('Agregar Instrumento a la Lista', style: blanco18),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colores.botonClaro,
                        child: TextField(
                          controller: _nombre,
                          onSubmitted: (_) => _agregar(),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _agregar,
                      icon: const Icon(Icons.add_circle, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _lista.length,
                    itemBuilder: (context, i) => Card(
                      color: Colores.botonClaro,
                      child: ListTile(
                        title: Text(_lista[i]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _editar(i),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _eliminar(i),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colores.botonClaro,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context, _lista),
                    child: const Text('Guardar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}