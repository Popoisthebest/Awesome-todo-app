import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  GestureTapCallback onTap;
  String title;

  String logoImage;

  CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.logoImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            SizedBox(
              width: 45,
              height: 25,
              child: Image.asset(logoImage),
            ),
            Center(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.40,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
