import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../themes/colores.dart';
import '../../widgets/fondos.dart';

class InventarioPartituras extends StatefulWidget {
  const InventarioPartituras({super.key});

  @override
  State<InventarioPartituras> createState() => _InventarioPartiturasState();
}

class _InventarioPartiturasState extends State<InventarioPartituras> {
  List<String> partituras = ['Himno de Colombia', 'Himno del Huila', 'Marcha Triunfal'];
  List<String> tipos = ['PDF', 'Imagen', 'Word'];

  bool mostrarLista = false;
  String? tipoElegido;
  String? nombreArchivo;

  // Abre los documentos del celular según el tipo
  void elegirArchivo(String tipo) async {
    List<String> extensiones = ['pdf'];
    if (tipo == 'Imagen') extensiones = ['jpg', 'jpeg', 'png'];
    if (tipo == 'Word') extensiones = ['doc', 'docx'];

    FilePickerResult? resultado = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensiones,
    );
    if (resultado != null) {
      setState(() {
        nombreArchivo = resultado.files.single.name;
      });
    }
  }

  // Agrega el archivo a la lista
  void guardar() {
    if (nombreArchivo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Primero elige un archivo')),
      );
      return;
    }
    setState(() {
      partituras.add(nombreArchivo!);
      nombreArchivo = null;
      tipoElegido = null;
      mostrarLista = true;
    });
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
                    'Inventario de Partituras',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                const SizedBox(height: 10),

                TextButton(
                  onPressed: () => setState(() => mostrarLista = !mostrarLista),
                  child: const Text(
                    'Lista ▾',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
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
                            for (String nombre in partituras)
                              Text(nombre, style: const TextStyle(fontSize: 14)),
                          ],
                        )
                      : null,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Agregar Documento',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colores.botonClaro,
                  child: DropdownButton<String>(
                    value: tipoElegido,
                    hint: const Text('Subir archivo'),
                    isExpanded: true,
                    underline: const SizedBox(),
                    dropdownColor: Colores.botonClaro,
                    items: [
                      for (String tipo in tipos)
                        DropdownMenuItem(value: tipo, child: Text(tipo)),
                    ],
                    onChanged: (valor) {
                      setState(() => tipoElegido = valor);
                      elegirArchivo(valor!);
                    },
                  ),
                ),
                if (nombreArchivo != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Archivo: $nombreArchivo',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colores.botonClaro,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: guardar,
                  child: const Text('Guardar'),
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