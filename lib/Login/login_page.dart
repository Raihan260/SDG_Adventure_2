import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sdg_adventure_2/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sdg_adventure_2/bottom_navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _accounts = {
    "user": "user123", // Akun user
    "admin": "admin123", // Akun admin
  };

  Future<void> _saveLoginStatus(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('role', role); // Simpan role (user atau admin)
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      if (_accounts.containsKey(username) && _accounts[username] == password) {
        // Simpan status login ke SharedPreferences
        await _saveLoginStatus(username);

        // Navigasi ke layar sesuai role
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavbar()),
        );
      } else {
        // Tampilkan pesan error jika login gagal
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid username or password")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.base,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(FluentIcons.arrow_left_32_filled, color: AppColor.mainBlack))
        ],
        title: const Text("Login",
          style: TextStyle(
            color: AppColor.mainBlack
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.base,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InputField(
                      controller: _usernameController, 
                      label: "Username", 
                      logo: const Icon(FluentIcons.person_24_filled, color: AppColor.mainGrey)
                    ),
                    const SizedBox(height: 8),
                    InputField(
                      controller: _passwordController, 
                      label: "Password", 
                      logo: const Icon(FluentIcons.lock_closed_24_filled, color: AppColor.mainGrey)
                    )
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _login, 
                  child: Text("Login", style: TextStyle(color: AppColor.mainBlack)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    minimumSize: const Size(364, 48),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Icon logo;

  const InputField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.focusNode,
    this.validator,
    required this.logo
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        logo,
        const SizedBox(height: 16),
        Text(label, style: const TextStyle(fontSize: 14, color: AppColor.mainGrey)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          focusNode: focusNode, // Menambahkan focusNode agar lebih stabil
          obscureText: obscureText,
          textInputAction: TextInputAction.done,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            filled: true,
            fillColor: AppColor.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}