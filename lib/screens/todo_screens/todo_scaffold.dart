import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TodoScaffold extends StatelessWidget {
  const TodoScaffold({super.key});

  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          storage.delete(key: "login");
          Navigator.pushNamed(context, '/welcome');
        },
        icon: const Icon(Icons.output_rounded),
      ),
    );
  }
}
