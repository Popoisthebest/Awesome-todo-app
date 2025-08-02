import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class TodoAppBar extends StatelessWidget {
  const TodoAppBar({super.key});

  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TimerBuilder.periodic(const Duration(seconds: 1), builder: (context) {
          return Text(
            DateFormat('yyyy년 MM월 dd일').format(DateTime.now()),
            style: const TextStyle(
              fontFamily: "Pretendard",
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
            ),
          );
        }),
        IconButton(
          onPressed: () {
            storage.delete(key: "login");
            Navigator.pushNamed(context, '/welcome');
          },
          icon: const Icon(Icons.output_rounded),
        ),
      ],
    );
  }
}
