import 'package:flutter/material.dart';
import 'package:flutter_mastering/screens_widgets/welcome_screen_widgets/app_name.dart';
import 'package:flutter_mastering/screens/welcome_screens/welcome_scaffold.dart';
import 'package:flutter_mastering/screens_widgets/welcome_screen_widgets/login_mathods.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeScaffold(
      appName: AppName(),
      loginMathods: LoginMathods(),
    );
  }
}
