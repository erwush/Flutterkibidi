

import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Logister extends StatefulWidget {
  const Logister({super.key});

  @override
  State<Logister> createState() => _MyWidgetState();
}

bool passwordVisible = false;

class _MyWidgetState extends State<Logister> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Form(
          child: Column(
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
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          // vertical: 8,
                        ),
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
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            ),
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
                          const SizedBox(height: 120),
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Role()),
                              // );
                            },

                            child: const Text("Masuk"),
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
                                  'assets/images/GOOGLE.png',
                                  height: 24,
                                  width: 24,
                                ),
                                label: const Text("Google"),
                                onPressed: () async {
                                  try {
                                    final user =
                                        await AuthService.signInWithGoogle();

                                    if (user != null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Login berhasil: ${user.email}',
                                          ),
                                        ),
                                      );

                                      print(user.displayName);
                                      print(user.email);
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error: $e')),
                                    );
                                  }
                                },
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
                                  'assets/images/apple.png',
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
                          TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Nama Depan',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Nama Belakang',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),

                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Password',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Role()),
                              // );
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
                                  'assets/images/GOOGLE.png',
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
                                  'assets/images/apple.png',
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
      ),
    );
  }
}
