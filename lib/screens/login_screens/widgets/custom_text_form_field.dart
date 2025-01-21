import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.icon,
    required this.isPassword,
    required this.textEditingController,
  });

  final String title;
  final String hintText;
  final Widget icon;
  final bool isPassword;
  final TextEditingController textEditingController;

  final String isPasswordShowingImage =
      'assets/login_screen_assets/off_eye.svg';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 6),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.35,
            ),
          ),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.only(right: 17),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: const Color(0xFFEFEFEF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: TextField(
                  controller: textEditingController,
                  cursorColor: const Color.fromARGB(255, 0, 0, 0),
                  cursorHeight: 20,
                  keyboardType: isPassword
                      ? TextInputType.visiblePassword
                      : TextInputType.emailAddress,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    border: InputBorder.none,
                    icon: icon,
                    iconColor: Colors.black.withOpacity(0.3499999940395355),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3499999940395355),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.35,
                    ),
                  ),
                ),
              ),
              isPassword
                  ? SvgPicture.asset(isPasswordShowingImage)
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
