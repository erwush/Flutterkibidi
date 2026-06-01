import 'package:flutter/material.dart';
import 'package:lapak_bantul/anu2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class NuggetPage3 extends StatelessWidget {
  const NuggetPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background nugget full layar
          SizedBox.expand(
            child: Image.asset('images/pocong.jpg', fit: BoxFit.cover),
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
                    "DUARKIBIDI",
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 67,
                      color: Colors.red[900],
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
