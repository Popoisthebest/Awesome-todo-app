import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  GestureTapCallback onTap;
  String title;
  Color containerColor;
  Color textColor;
  bool isBordered;
  bool isLogoRequired;
  String logoImage;

  CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.containerColor,
    required this.textColor,
    required this.isBordered,
    required this.isLogoRequired,
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
          color: containerColor,
          border: isBordered
              ? Border.all(
                  color: Colors.white,
                  width: 1,
                )
              : null,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            SizedBox(
                width: 45,
                height: 25,
                child:
                    isLogoRequired ? Image.asset(logoImage) : const SizedBox()),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
