import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TodoAddAppBar extends StatelessWidget {
  const TodoAddAppBar({super.key});

  final String backIcon = 'assets/login_screen_assets/back_icon.svg';

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(backIcon),
        ),
        const Center(
          child: Text(
            "할 일 추가",
            style: TextStyle(
              fontFamily: "Pretendard",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
              height: 28 / 20,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
