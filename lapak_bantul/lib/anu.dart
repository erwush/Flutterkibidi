import 'package:flutter/material.dart';
import 'package:lapak_bantul/anu2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class NuggetPage extends StatelessWidget {
  const NuggetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background nugget full layar
          SizedBox.expand(
            child: Image.asset('images/naget.jpg', fit: BoxFit.cover),
          ),

          // Overlay gelap biar teks kebaca
          Container(color: Colors.black.withOpacity(0.4)),

          // Konten utama
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "TS IS NAGET",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade200,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Naget itu enak\n"
                    "Naget itu mantap\n"
                    "Naget itu sedap\n"
                    "Nagetkibidi skibidi skibidi naget\n"
                    "Naget 67",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NuggetPage2(),
                          ),
                        );
                      },
                      child: Text(
                      "NAGET(ini bukan tombol, gk bisa dipencet)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
