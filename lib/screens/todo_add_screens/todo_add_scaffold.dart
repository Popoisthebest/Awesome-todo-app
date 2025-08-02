import 'package:flutter/material.dart';

class TodoAddScaffold extends StatelessWidget {
  const TodoAddScaffold({
    super.key,
    required this.todoAddAppBar,
    required this.todoAddTextField,
  });

  final Widget todoAddAppBar;
  final Widget todoAddTextField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const Center(
              child: Text(
                "Goaler",
                style: TextStyle(
                  fontFamily: "Ghanachocolate",
                  fontSize: 64,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(10, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      todoAddAppBar,
                      const SizedBox(height: 44),
                      todoAddTextField,
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
