import 'package:flutter/material.dart';

class LoginScaffold extends StatelessWidget {
  const LoginScaffold({
    super.key,
    required this.loginAppBar,
    required this.loginTextField,
  });

  final Widget loginAppBar;
  final Widget loginTextField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            loginAppBar,
            const SizedBox(height: 44),
            loginTextField,
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
