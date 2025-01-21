import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Goaler",
              style: TextStyle(
                fontFamily: "Ghanachocolate",
                fontSize: 48,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
                letterSpacing: -1.20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "체크리스트를\n모두 채우는 그날까지.",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
                letterSpacing: -0.40,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
