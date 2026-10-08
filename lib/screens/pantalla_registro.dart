import 'package:flutter/material.dart';
import '../themes/colores.dart';
import '../widgets/fondos.dart';

// Pantalla para registrar un integrante nuevo
class PantallaRegistro extends StatelessWidget {
  const PantallaRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    // Estilo del título amarillo, lo usamos arriba y abajo
    final estiloTitulo = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colores.amarillo,
    );

    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Image.asset('assets/images/fondo_login1.png', height: 150),
                SizedBox(height: 10),
                Text('Registrar Integrantes', style: estiloTitulo),
                SizedBox(height: 30),
                CampoRegistro(texto: 'Nombre'),
                SizedBox(height: 20),
                CampoRegistro(texto: 'Correo'),
                SizedBox(height: 20),
                CampoRegistro(texto: 'Contraseña', oculto: true),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colores.botonClaro,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    // Aquí después guardas el integrante
                  },
                  child: Text(
                    'REGISTRAR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'BANDA SINFONICA SAN MIGUEL DE GARZÓN',
                  textAlign: TextAlign.center,
                  style: estiloTitulo.copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Caja clara con nota musical, campo de texto y línea de colores abajo
class CampoRegistro extends StatelessWidget {
  final String texto;
  final bool oculto;

  const CampoRegistro({super.key, required this.texto, this.oculto = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colores.botonClaro,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.music_note, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                TextField(
                  obscureText: oculto,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: texto,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
                // Línea con degradado de amarillo a morado
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colores.amarillo, Colors.purple],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}