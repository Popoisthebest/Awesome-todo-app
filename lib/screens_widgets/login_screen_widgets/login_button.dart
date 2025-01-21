import 'package:flutter/material.dart';
import 'package:flutter_mastering/models/login_model.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  final LoginModel loginModel = LoginModel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 355,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            '로그인',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.45,
            ),
          ),
        ),
      ),
    );
  }
}
