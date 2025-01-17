import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mastering/firebase_options.dart';
import 'package:flutter_mastering/models/todo_model.dart';
import 'package:flutter_mastering/screens/login_screens/login_main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginMainScreen(),
      ),
    );
  }
}
