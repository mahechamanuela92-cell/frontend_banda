import 'package:flutter/material.dart';
import '../themes/colores.dart';
import '../widgets/fondos.dart';
import 'pantalla_editar.dart';

class InventarioInstrumentos extends StatefulWidget {
  const InventarioInstrumentos({super.key});

  @override
  State<InventarioInstrumentos> createState() => _InventarioInstrumentosState();
}

class _InventarioInstrumentosState extends State<InventarioInstrumentos> {
  List<String> instrumentos = [
    'Flauta Traversa', 'Flauta Picolo', 'Clarinete', 'Saxófono',
    'Oboe', 'Fagot', 'Trompeta', 'Fliscorno', 'Trombón',
    'Bombardino', 'Tuba', 'Corneta', 'Violín', 'Viola',
    'Violonchelo', 'Contrabajo', 'Bombo', 'Redoblante',
    'Platillos', 'Batería', 'Glockenspiel', 'Timbales Sinfónicos',
    'Congas', 'Timbal',
  ];

  List<String> estados = [
    'Mantenimiento', 'Buen Estado', 'Mal Estado', 'Préstamo',
  ];

  bool mostrarLista = false;
  String? estadoElegido;

  // Abre la pantalla de editar y guarda la lista actualizada
  void irAEditar() async {
    final nuevaLista = await Navigator.push<List<String>>(
      context,
      MaterialPageRoute(
        builder: (context) => PantallaEditar(instrumentos: instrumentos),
      ),
    );

    if (nuevaLista != null) {
      setState(() {
        instrumentos = nuevaLista;
        mostrarLista = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título centrado
                const Center(
                  child: Text(
                    'Inventario de Instrumentos',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                const SizedBox(height: 10),

                // Fila: "Lista" y botón "Editar Lista"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          mostrarLista = !mostrarLista;
                        });
                      },
                      child: const Text(
                        'Lista ▾',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: irAEditar,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                      ),
                      child: const Text('Editar Lista'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Caja con la lista (organizada en 2 columnas)
                Container(
                  width: double.infinity,
                  height: 300,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colores.botonClaro,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: mostrarLista
                      ? GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 5,
                          children: [
                            for (String nombre in instrumentos)
                              Text(
                                nombre,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        )
                      : null,
                ),
                const SizedBox(height: 20),

                const Text(
                  'Instrumento en',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colores.botonClaro,
                  child: DropdownButton<String>(
                    value: estadoElegido,
                    isExpanded: true,
                    underline: const SizedBox(),
                    dropdownColor: Colores.botonClaro,
                    style: const TextStyle(color: Colors.black),
                    items: [
                      for (String estado in estados)
                        DropdownMenuItem(value: estado, child: Text(estado)),
                    ],
                    onChanged: (valor) {
                      setState(() {
                        estadoElegido = valor;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Serial',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 6),
                Container(
                  color: Colores.botonClaro,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.redAccent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}