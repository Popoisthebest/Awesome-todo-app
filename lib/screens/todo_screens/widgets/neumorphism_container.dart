import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NeumorphismContainer extends StatelessWidget {
  double? width;
  double? height;
  Widget? child;
  EdgeInsets? padding;
  bool isTextField;

  NeumorphismContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.padding,
    required this.isTextField,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          // 좌상단 그림자(밝은)
          BoxShadow(
            color: Colors.white,
            offset: isTextField ? const Offset(-4, -4) : const Offset(-10, -10),
            blurRadius: isTextField ? 10 : 20,
            spreadRadius: 1,
          ),
          // 우하단 그림자(어두운)
          BoxShadow(
            color: Colors.grey.shade400,
            offset: isTextField ? const Offset(4, 4) : const Offset(10, 10),
            blurRadius: isTextField ? 10 : 20,
            spreadRadius: 1,
          )
        ],
      ),
      child: child,
    );
  }
}
