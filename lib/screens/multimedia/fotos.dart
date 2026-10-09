import 'package:flutter/material.dart';
import 'package:frontend/widgets/fondos.dart';

class FotosPantalla extends StatelessWidget {
  const FotosPantalla({super.key});

  // Lista dinámicamente extensible de imágenes
  final List<String> fotos = const [
    'https://picsum.photos/600/600?random=1',
    'https://picsum.photos/600/600?random=2',
    'https://picsum.photos/600/600?random=3',
    'https://picsum.photos/600/600?random=4',
    'https://picsum.photos/600/600?random=5',
    'https://picsum.photos/600/600?random=6',
    'https://picsum.photos/600/600?random=7',
    'https://picsum.photos/600/600?random=8',
  ];

  // Función para abrir imagen en grande (Modal)
  void _mostrarFotoGrande(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            InteractiveViewer(
              child: Center(
                child: Image.network(url, fit: BoxFit.contain),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      body: FondoBase(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF0D1E1C).withOpacity(0.92),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.orange, size: 26),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Fotos",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  Expanded(
                    child: RawScrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      thumbColor: const Color(0xFFD3A456),
                      thickness: 6,
                      radius: const Radius.circular(10),
                      child: GridView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.only(right: 12),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // De a 2 por fila
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: fotos.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => _mostrarFotoGrande(context, fotos[index]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                fotos[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Text(
                    "BANDA SINFÓNICA SAN MIGUEL DE GARZÓN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD3A456),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
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