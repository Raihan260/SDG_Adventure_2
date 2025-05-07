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
    "user": "user123",
    "admin": "admin123",
  };

  Future<void> _saveLoginStatus(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('role', role);
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      if (_accounts.containsKey(username) && _accounts[username] == password) {
        await _saveLoginStatus(username);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavbar()),
        );
      } else {
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
            icon: const Icon(
              FluentIcons.arrow_left_32_filled,
              color: AppColor.mainBlack,
            ),
          )
        ],
        title: const Text(
          "Login",
          style: TextStyle(color: AppColor.mainBlack),
        ),
        centerTitle: true,
        backgroundColor: AppColor.base,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InputField(
                        controller: _usernameController,
                        label: "Username",
                        icon: const Icon(
                          FluentIcons.person_24_regular,
                          color: AppColor.mainGrey,
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Please enter your username' : null,
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        controller: _passwordController,
                        label: "Password",
                        obscureText: true,
                        icon: const Icon(
                          FluentIcons.lock_closed_24_regular,
                          color: AppColor.mainGrey,
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Please enter your password' : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size(364, 48),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: AppColor.mainBlack),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        width: 104,
                        height: 3,
                        color: AppColor.mainBlack,
                      ),
                      const SizedBox(width: 8),
                      const Text("or", style: TextStyle(color: AppColor.mainBlack),),
                      const SizedBox(width: 8),
                      Container(
                        width: 104,
                        height: 3,
                        color: AppColor.mainBlack,
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {}, 
                    child: Row(
                      children: [
                        Image.asset('google.png', width: 24, height: 24),
                        const SizedBox(width: 16),
                        const Text("Login with Google", style: TextStyle(color: AppColor.mainBlack))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.white,
                      shadowColor: Colors.black.withOpacity(0.1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final Icon icon;
  final String? Function(String?)? validator;

  const InputField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    required this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 4), // Arah dan intensitas bayangan
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: label, hintStyle: TextStyle(color: AppColor.mainGrey),
          filled: true,
          fillColor: AppColor.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}