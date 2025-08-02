import 'package:flutter/material.dart';
import 'package:flutter_mastering/screens/login_screens/login_screen.dart';
import 'package:flutter_mastering/screens/welcome_screens/widgets/custom_button.dart';

class LoginMathods extends StatelessWidget {
  const LoginMathods({super.key});

  final String googleLogoImage =
      'assets/welcome_screen_assets/login_mathod_icons/Google_logo.png';
  final String facebookLogoImage =
      'assets/welcome_screen_assets/login_mathod_icons/Facebook_logo.png';
  final String appleLogoImage =
      'assets/welcome_screen_assets/login_mathod_icons/Apple_logo.png';
  final String emailLogoImage =
      'assets/welcome_screen_assets/login_mathod_icons/Email_logo.png';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Column(
                spacing: 5,
                children: [
                  CustomButton(
                    onTap: () {},
                    title: 'Google로 계속하기',
                    logoImage: googleLogoImage,
                  ),
                  CustomButton(
                    onTap: () {},
                    title: 'Facebook로 계속하기',
                    logoImage: facebookLogoImage,
                  ),
                  CustomButton(
                    onTap: () {},
                    title: 'Apple로 계속하기',
                    logoImage: appleLogoImage,
                  ),
                  CustomButton(
                    onTap: () {},
                    title: '이메일로 계속하기',
                    logoImage: emailLogoImage,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text(
                    '이미 계정이 있나요?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      '로그인',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF189FFF),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF189FFF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '계속 진행하시면 Goaler의 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.30,
                  ),
                ),
                TextSpan(
                  text: '서비스 약관',
                  style: TextStyle(
                    color: Color(0xFF189FFF),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.30,
                  ),
                ),
                TextSpan(
                  text: ' 및 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.30,
                  ),
                ),
                TextSpan(
                  text: '개인정보처리\n방침',
                  style: TextStyle(
                    color: Color(0xFF189EFF),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.30,
                  ),
                ),
                TextSpan(
                  text: '에 동의하시게 됩니다.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.30,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
