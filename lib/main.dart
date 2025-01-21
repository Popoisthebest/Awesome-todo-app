import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mastering/firebase_options.dart';
import 'package:flutter_mastering/models/login_model.dart';
import 'package:flutter_mastering/models/todo_model.dart';
import 'package:flutter_mastering/screens/login_screens/login_screen.dart';
import 'package:flutter_mastering/screens/todo_screens/todo_screen.dart';
import 'package:flutter_mastering/screens/welcome_screens/welcome_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginModel()),
        ChangeNotifierProvider(create: (_) => TodoModel()),
      ],
      child: MaterialApp(
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => const WelcomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/todo_screen': (context) => const TodoScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
      ),
    );
  }
}
