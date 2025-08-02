import 'package:flutter/material.dart';
import 'package:flutter_mastering/models/login_model.dart';
import 'package:flutter_mastering/screens/login_screens/widgets/custom_text_form_field.dart';
import 'package:flutter_mastering/screens_widgets/login_screen_widgets/login_button.dart';
import 'package:flutter_mastering/screens_widgets/login_screen_widgets/login_setting.dart';
import 'package:flutter_mastering/screens_widgets/welcome_screen_widgets/app_name.dart';
import 'package:provider/provider.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField({super.key});

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> checkLoginStatus() async {
      bool isLoginSuccess =
          await context.read<LoginModel>().getIsLoginSuccess();

      if (isLoginSuccess) {
        Navigator.pushNamed(context, '/todo_screen');
      } else {
        debugPrint('로그인 실패...');
      }
    }

    return Expanded(
      child: SizedBox(
        width: 355,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 20,
          children: [
            Column(
              children: [
                CustomTextFormField(
                  textEditingController: emailTextEditingController,
                  title: '이메일',
                  hintText: '이메일을 입력해 주세요.',
                  isIcon: true,
                  icon: const Icon(Icons.email),
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  textEditingController: passwordTextEditingController,
                  title: '비밀번호',
                  hintText: '비밀번호을 입력해 주세요.',
                  isIcon: true,
                  icon: const Icon(Icons.lock),
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                const LoginSetting(),
              ],
            ),
            const AppName(),
            LoginButton(
              onTap: () async {
                debugPrint('로그인 버튼 눌림');

                context.read<LoginModel>().login(
                      emailTextEditingController.text,
                      passwordTextEditingController.text,
                    );
                checkLoginStatus();
              },
            ),
          ],
        ),
      ),
    );
  }
}
