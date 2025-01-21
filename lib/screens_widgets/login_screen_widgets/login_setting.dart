import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginSetting extends StatefulWidget {
  const LoginSetting({super.key});

  @override
  State<LoginSetting> createState() => _LoginSettingState();
}

class _LoginSettingState extends State<LoginSetting> {
  final String checkBoxTrueImage =
      'assets/login_screen_assets/check_box_true.svg';
  final String checkBoxFalseImage =
      'assets/login_screen_assets/check_box_false.svg';

  bool isAutoLogin = false;

  void onAutoLoginTap() {
    setState(() {
      isAutoLogin = !isAutoLogin;
      print(isAutoLogin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  print('자동 로그인 눌림');
                  onAutoLoginTap();
                },
                child: SvgPicture.asset(
                  isAutoLogin ? checkBoxTrueImage : checkBoxFalseImage,
                )),
            const SizedBox(width: 3),
            const Text(
              '자동 로그인',
              style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            print('아이디/비밀번호 찾기 눌림');
          },
          child: const Text(
            "아이디/비밀번호 찾기",
            style: TextStyle(
              fontFamily: "Pretendard",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
        )
      ],
    );
  }
}
