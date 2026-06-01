//*by me, polished by claude

import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/api_service.dart';

class Logister extends StatefulWidget {
  const Logister({super.key});

  @override
  State<Logister> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Logister> {
  // --- Controllers Login ---
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();

  // --- Controllers Daftar ---
  final _registerFirstNameController = TextEditingController();
  final _registerLastNameController = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();
  final _registerConfirmPasswordController = TextEditingController();

  // --- State ---
  bool _loginPasswordVisible = false;
  bool _registerPasswordVisible = false;
  bool _registerConfirmPasswordVisible = false;
  bool _isLoginLoading = false;
  bool _isRegisterLoading = false;

  @override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _registerFirstNameController.dispose();
    _registerLastNameController.dispose();
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    _registerConfirmPasswordController.dispose();
    super.dispose();
  }

  // --- Login Handler ---
  Future<void> _handleLogin() async {
    final email = _loginEmailController.text.trim();
    final password = _loginPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan password tidak boleh kosong')),
      );
      return;
    }

    setState(() => _isLoginLoading = true);

    try {
      final token = await ApiService.login(email, password);
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login berhasil! Token: $token')),
      );

      // TODO: Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));

    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login gagal: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoginLoading = false);
    }
  }

  // --- Register Handler ---
  Future<void> _handleRegister() async {
    final firstName = _registerFirstNameController.text.trim();
    final lastName = _registerLastNameController.text.trim();
    final email = _registerEmailController.text.trim();
    final password = _registerPasswordController.text.trim();
    final confirmPassword = _registerConfirmPasswordController.text.trim();

    // Validasi
    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua kolom wajib diisi')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password dan konfirmasi password tidak sama')),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password minimal 6 karakter')),
      );
      return;
    }

    setState(() => _isRegisterLoading = true);

    try {
      final result = await ApiService.register(email, password);
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Daftar berhasil! ID: ${result['id']}, Token: ${result['token']}')),
      );

      // TODO: Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));

    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrasi gagal: $e')),
      );
    } finally {
      if (mounted) setState(() => _isRegisterLoading = false);
    }
  }

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
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: const BorderRadius.only(
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
                      const Divider(
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
                    // ─── TAB MASUK ───────────────────────────────────────
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _loginEmailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: _loginPasswordController,
                            obscureText: !_loginPasswordVisible,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: IconButton(
                                  onPressed: () => setState(
                                      () => _loginPasswordVisible = !_loginPasswordVisible),
                                  icon: Icon(_loginPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              TextButton(
                                style: TextButton.styleFrom(foregroundColor: Colors.black),
                                onPressed: () {},
                                child: const Text("Lupa Password?"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 80),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed: _isLoginLoading ? null : _handleLogin,
                            child: _isLoginLoading
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: CircularProgressIndicator(
                                        color: Colors.white, strokeWidth: 2.5))
                                : const Text("Masuk"),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              Expanded(child: Divider(thickness: 1)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("Atau Masuk Dengan"),
                              ),
                              Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  minimumSize: const Size(50, 50),
                                ),
                                icon: Image.asset('assets/images/GOOGLE.png',
                                    height: 24, width: 24),
                                label: const Text("Google"),
                                onPressed: () async {
                                  try {
                                    final user = await AuthService.signInWithGoogle();
                                    if (!mounted) return;
                                    if (user != null) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Login berhasil: ${user.email}')),
                                      );
                                    }
                                  } catch (e) {
                                    if (!mounted) return;
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
                                      borderRadius: BorderRadius.circular(8)),
                                  minimumSize: const Size(50, 50),
                                ),
                                icon: Image.asset('assets/images/apple.png',
                                    height: 24, width: 24),
                                label: const Text("Apple"),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text("Dengan ini, kamu menyetujui tentang"),
                          const Text("Ketentuan Layanan",
                              style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),

                    // ─── TAB DAFTAR ──────────────────────────────────────
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _registerFirstNameController,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Nama Depan',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _registerLastNameController,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Nama Belakang',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _registerEmailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _registerPasswordController,
                            obscureText: !_registerPasswordVisible,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'Password',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: IconButton(
                                  onPressed: () => setState(() =>
                                      _registerPasswordVisible =
                                          !_registerPasswordVisible),
                                  icon: Icon(_registerPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _registerConfirmPasswordController,
                            obscureText: !_registerConfirmPasswordVisible,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.lock_outline),
                              labelText: 'Konfirmasi Password',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: IconButton(
                                  onPressed: () => setState(() =>
                                      _registerConfirmPasswordVisible =
                                          !_registerConfirmPasswordVisible),
                                  icon: Icon(_registerConfirmPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed: _isRegisterLoading ? null : _handleRegister,
                            child: _isRegisterLoading
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: CircularProgressIndicator(
                                        color: Colors.white, strokeWidth: 2.5))
                                : const Text("Daftar Sekarang"),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              Expanded(child: Divider(thickness: 1)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("Atau Daftar Dengan"),
                              ),
                              Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  minimumSize: const Size(50, 50),
                                ),
                                icon: Image.asset('assets/images/GOOGLE.png',
                                    height: 24, width: 24),
                                label: const Text("Google"),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 16),
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  minimumSize: const Size(50, 50),
                                ),
                                icon: Image.asset('assets/images/apple.png',
                                    height: 24, width: 24),
                                label: const Text("Apple"),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text("Dengan ini, kamu menyetujui tentang"),
                          const Text("Ketentuan Layanan",
                              style: TextStyle(color: Colors.blue)),
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