import 'package:flutter/material.dart';
import 'package:lapak_bantul/home_page.dart';
import 'package:lapak_bantul/home_page_part2.dart';
import 'package:lapak_bantul/pbb1.dart';
import 'package:lapak_bantul/pbb2.dart';
import 'package:lapak_bantul/layanan_keliling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DetailSPPT extends StatelessWidget {
  const DetailSPPT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
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
                              'assets/images/LalyLogoW.png',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "No. NOP 378429749820294337",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              "NAGETKIBIDI GORENG TEPUNG ENAK SEDAP MANTAP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 14),
                children: [
                  TextSpan(
                    text: "Alamat Lengkap WP : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        "Kab Ini, Kec. Itu, Desa sana, RT00/RW00",
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              width: double.infinity,

              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      _buildDetail("Lokasi", "DS. Asimilasi Songgon-Ketapang, RT06/RW07"),
                      Text(
                        "Status",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Sudah Lunas",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(color: Colors.black),
                      _buildDetail("Denda", "Rp. 99999999999"),
                      _buildDetail("NJOP Bumi", "Rp. 67676767"),
                      _buildDetail("NJOP Bangunan", "Rp.Gratis"),
                      _buildDetail("Luas Bumi", "Gk tau"),
                      _buildDetail("Luas Bangunan", "Segitu"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String title, String text) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),

          Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Divider(color: Colors.black),
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
