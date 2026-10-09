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
          setState(() => nombreArchivo = resultado.files.single.name);
        }
      }

      // Agrega el archivo y vuelve a la pantalla de inicio
      void guardar() {
        if (nombreArchivo == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Primero elige un archivo')),
          );
          return;
        }
        partituras.add(nombreArchivo!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Partitura guardada')),
        );
        Navigator.pop(context);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // Imagen del ave (detrás)
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Image.asset('assets/images/fondo_login.png', height: 180),
                      ),
                    ),
                    // Bloque contenedor oscuro semitransparente extendido hacia abajo
                    Container(
                        margin: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.75),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Column(
                          children: [
                            const Text(
                              'Inventario de Partituras',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          
                            
                            // Espacio donde queda el ave expuesta
                            const SizedBox(height: 200),

                             TextButton(
                              onPressed: () => setState(() => mostrarLista = !mostrarLista),
                              child: const Text(
                                'Lista ▾',
                                style: TextStyle(color: Colors.white, fontSize: 22),
                              ),
                            ),

                            // Recuadro claro de la Lista (ubicado justo donde indicas la línea verde)
                            Container(
                              width: double.infinity,
                              height: 180,
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
                                          Text(nombre, style: const TextStyle(fontSize: 14, color: Colors.black)),
                                      ],
                                    )
                                  : null,
                            ),
                            const SizedBox(height: 24),
                            
                            // Sección Agregar Documento dentro del mismo fondo oscuro
                            const Text(
                              'Agregar Documento',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colores.botonClaro,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton<String>(
                                value: tipoElegido,
                                hint: const Text('Subir archivo', style: TextStyle(color: Colors.black54)),
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
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Archivo: $nombreArchivo',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            const SizedBox(height: 76),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colores.botonClaro,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: guardar,
                              child: const Text('Guardar', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Texto inferior fuera del bloque
               Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: Text(
                      'BANDA SINFONICA SAN MIGUEL DE GARZÓN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colores.colorLetra1,
                        fontWeight: FontWeight.bold,
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