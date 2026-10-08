import 'package:flutter/material.dart';
import '../fondos.dart';

class PercusionPantalla extends StatelessWidget {
  const PercusionPantalla({super.key});

  final List<String> instrumentos = const [
    'Bombo',
    'Redoblante',
    'Platillos',
    'Batería',
    'Glockenspiel',
    'Timbales Sinfónicos',
    'Congas',
    'Timbal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color(0xFF0D1E1C).withOpacity(0.9),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.orange, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 10),

                  Theme(
                    data: ThemeData(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      tilePadding: EdgeInsets.zero,
                      title: const Text(
                        "Percusión",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Serif',
                        ),
                      ),
                      children: instrumentos.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: ExpansionTile(
                            iconColor: Colors.white,
                            collapsedIconColor: Colors.white,
                            tilePadding: EdgeInsets.zero,
                            title: Text(
                              item,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 17,
                                fontFamily: 'Serif',
                              ),
                            ),
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Detalles del instrumento...",
                                  style: TextStyle(color: Colors.white54),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const Spacer(),

                  const Center(
                    child: Text(
                      "BANDA SINFÓNICA SAN MIGUEL DE GARZÓN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD3A456),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}