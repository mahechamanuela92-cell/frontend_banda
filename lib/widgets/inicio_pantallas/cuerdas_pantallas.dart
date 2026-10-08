import 'package:flutter/material.dart';
import 'package:frontend/widgets/fondos.dart';

// Importación de componentes de instrumentos de cuerda
import 'instrumentos-cuerda/violin.dart';
import 'instrumentos-cuerda/viola.dart';
import 'instrumentos-cuerda/violonchelo.dart';
import 'instrumentos-cuerda/contrabajo.dart';

class CuerdasPantalla extends StatelessWidget {
  const CuerdasPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF0D1E1C).withOpacity(0.92),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.orange, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: const ExpansionTile(
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white,
                          title: Text(
                            "Cuerdas",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Serif',
                            ),
                          ),
                          children: [
                            // 1. Violín
                            ViolinItem(),
                            // 2. Viola
                            ViolaItem(),
                            // 3. Violonchelo
                            VioloncheloItem(),
                            // 4. Contrabajo
                            ContrabajoItem(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const Center(
                    child: Text(
                      "BANDA SINFÓNICA SAN MIGUEL DE GARZÓN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD3A456),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}