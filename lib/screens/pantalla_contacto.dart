import 'package:flutter/material.dart';
import '../themes/colores.dart';
import '../widgets/fondos.dart';

class PantallaContacto extends StatelessWidget {
  const PantallaContacto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: Column(
            children: [
              // Flecha para volver
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colores.naranja, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // Logo
              Image.asset('assets/images/fondo_login1.png', height: 130),
              SizedBox(height: 20),

              // Título claro
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colores.botonClaro,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'CONTÁCTENOS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Caja oscura con los datos
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colores.cajaOscura,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.white),
                        SizedBox(width: 15),
                        Text('3225172363', style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.white),
                        SizedBox(width: 15),
                        Text('mahechamanuela92@gmail.com', style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.location_city, color: Colors.white),
                        SizedBox(width: 15),
                        Text('Casa de la cultura', style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // Título de abajo
              Text(
                'BANDA SINFONICA SAN MIGUEL DE GARZÓN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colores.amarillo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}