import 'package:flutter/material.dart';
import 'package:lapak_bantul/home_page.dart';
import 'package:lapak_bantul/home_page_part2.dart';
import 'package:lapak_bantul/layanan_keliling.dart';
import 'package:lapak_bantul/pbb1.dart';
import 'package:lapak_bantul/pbb2.dart';
import 'package:lapak_bantul/detail_sppt.dart';
import 'package:lapak_bantul/logister.dart';
import 'package:lapak_bantul/formtest.dart';
import 'package:lapak_bantul/users_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = [
    HomePage(),
    LayananKeliling(),
    PBB1(),
    DetailSPPT(),
    Logister(),
    UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        selectedIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,


        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Layanan Keliling",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "PBB",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "SPPT",
          ),  

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Logister",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "User",
          ),
        ],
      ),
    );
  }
}