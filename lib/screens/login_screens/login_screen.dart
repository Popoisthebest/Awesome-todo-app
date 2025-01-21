import 'package:flutter/material.dart';
import 'package:flutter_mastering/screens/login_screens/login_scaffold.dart';
import 'package:flutter_mastering/screens_widgets/login_screen_widgets/login_app_bar.dart';
import 'package:flutter_mastering/screens_widgets/login_screen_widgets/login_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      loginAppBar: const LoginAppBar(),
      loginTextField: LoginTextField(),
    );
  }
}
