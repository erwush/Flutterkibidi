import 'package:flutter/material.dart';
import 'package:lapak_bantul/anu3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class NuggetPage2 extends StatelessWidget {
  const NuggetPage2({super.key});

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
                  const SizedBox(height: 20),
                  Text(
                    "DIBILANGIN BUKAN TOMBOL REK\n",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 67,
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
                            builder: (context) => const NuggetPage3(),
                          ),
                        );
                      },
                      child: Text(
                      "JANGAN DIPENCET",
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
