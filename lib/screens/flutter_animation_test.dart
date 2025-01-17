import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyWidget()));

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyWidget> {
  var opacityValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'AnimatedOpacity',
            ),
            AnimatedOpacity(
              opacity: opacityValue,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    child: const Text("Fade In"),
                    onPressed: () => setState(() {
                          opacityValue = 1.0;
                        })),
                ElevatedButton(
                    child: const Text("Fade Out"),
                    onPressed: () => setState(() {
                          opacityValue = 0.0;
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
