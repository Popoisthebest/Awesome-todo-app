import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({super.key});

  final String backIconImage = 'assets/login_screen_assets/back_icon.svg';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/welcome');
            },
            child: SvgPicture.asset(backIconImage),
          ),
          const Center(
            child: Text(
              '로그인',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
