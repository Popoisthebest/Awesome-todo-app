import 'package:flutter/material.dart';

class TodoCustomButton extends StatelessWidget {
  const TodoCustomButton({
    super.key,
    required this.isBorder,
    required this.title,
    required this.color,
    required this.textColor,
  });

  final bool isBorder;
  final String title;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: isBorder ? 2 : 0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
