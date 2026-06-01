import 'package:flutter/material.dart';
import 'package:muara_app/role.dart';

class Logister extends StatelessWidget {
  const Logister({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft, // biar mojok kiri
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true, // penting biar ga full
                      indicator: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                      dividerColor: Colors.transparent,

                      tabs: const [
                        Tab(text: "Masuk"),
                        Tab(text: "Daftar"),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 40,
                      endIndent: 40,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email/No Wa',
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Role()),
                            );
                          },

                          child: const Text("Masuk"),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              child: const Text("Lupa Password?"),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text("Atau Masuk Dengan"),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: const Size(50, 50),
                              ),
                              icon: Image.asset(
                                'assets/GOOGLE.png',
                                height: 24,
                                width: 24,
                              ),
                              label: const Text("Google"),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 16),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: const Size(50, 50),
                              ),
                              icon: Image.asset(
                                'assets/apple.png',
                                height: 24,
                                width: 24,
                              ),
                              label: const Text("Apple"),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text("Dengan ini, kamu menyetujui tentang"),
                        Text(
                          "Ketentuan Layanan",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nama Kamu',
                          ),
                        ),
                        const SizedBox(height: 4),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email/No Wa',
                          ),
                        ),
                        const SizedBox(height: 4),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                        const SizedBox(height: 4),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Konfirmasi Password',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Role()),
                            );
                          },

                          child: const Text("Daftar Sekarang"),
                        ),
                      
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text("Atau Masuk Dengan"),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: const Size(50, 50),
                              ),
                              icon: Image.asset(
                                'assets/GOOGLE.png',
                                height: 24,
                                width: 24,
                              ),
                              label: const Text("Google"),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 16),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: const Size(50, 50),
                              ),
                              icon: Image.asset(
                                'assets/apple.png',
                                height: 24,
                                width: 24,
                              ),
                              label: const Text("Apple"),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        
                        Text("Dengan ini, kamu menyetujui tentang"),
                        Text(
                          "Ketentuan Layanan",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
