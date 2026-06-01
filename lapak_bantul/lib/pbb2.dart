import 'package:flutter/material.dart';
import 'package:lapak_bantul/home_page.dart';
import 'package:lapak_bantul/home_page_part2.dart';
import 'package:lapak_bantul/pbb1.dart';
import 'package:lapak_bantul/layanan_keliling.dart';
import 'package:lapak_bantul/detail_sppt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class PBB2 extends StatelessWidget {
  const PBB2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: const Text(
          'PBB',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                   DrawerHeader(
                    decoration: BoxDecoration(color: Color(0xFF003566)),
                    child:  Image.asset(
                              'assets/images/LalyLogo.png',
                              width: 150.0,
                              height: 100.0,
                              fit: BoxFit.contain,
                            ),
                  ),
                  ListTile(
                    title: const Text('Home Page'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Home Page 2'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage2(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Layanan Keliling'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LayananKeliling(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('PBB 1'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PBB1()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('PBB 2'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PBB2()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Detail SPPT'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailSPPT(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('< Kembali'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),

            SearchBar(hintText: "Masukan NOP...", leading: Icon(Icons.search)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Padding(padding: const EdgeInsets.only(top: 20)),
                  const SizedBox(height: 10),
                  _buildSPPT(
                    "SPPT 2021",
                    "DS. Ngireng-ireng RT01/RW01",
                    "Njop Bumi dan Bangunan",
                    "200,000",
                    false,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailSPPT()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildSPPT(
                    "SPPT 2020",
                    "DS. Ngireng-ireng RT01/RW01",
                    "Njop Bumi dan Bangunan",
                    "376,000",
                    true,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailSPPT()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSPPT(
    String title,
    String location,
    String text,
    String uang,
    bool isLunas,
    VoidCallback onTap,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isLunas ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isLunas ? "Lunas" : "Belum Lunas",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Colors.black),
              Text(
                location,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Icon(Icons.attach_money_rounded, color: Colors.black),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),

                decoration: BoxDecoration(
                  color: Colors.indigo[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  uang,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Text(
                "Detail >",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateItem(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.indigo[900] : Colors.indigo[50],
        borderRadius: BorderRadius.circular(8),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_month,
            color: isSelected ? Colors.yellow : Colors.black,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
