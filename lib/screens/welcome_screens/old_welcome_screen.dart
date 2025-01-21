// import 'package:flutter/material.dart';
// import 'package:flutter_mastering/models/todo_firebase_model.dart';
// import 'package:flutter_mastering/models/todo_model.dart';
// import 'package:flutter_mastering/screens/intro_screens/login_screens/login_screen.dart';
// import 'package:flutter_mastering/screens/intro_screens/sign_up_screens/sign_up_screen.dart';
// import 'package:flutter_mastering/screens/intro_screens/welcome_screens/welcome_screens_widgets/custom_button.dart';
// import 'package:flutter_mastering/screens/todo_screens/todo_screen.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class OldWelcomeScreen extends StatefulWidget {
//   const OldWelcomeScreen({super.key});

//   @override
//   State<OldWelcomeScreen> createState() => _OldWelcomeScreenState();
// }

// class _OldWelcomeScreenState extends State<OldWelcomeScreen> {
//   String backgroundImage =
//       'assets/login_screen_assets/todo_login_background.jpeg';
//   String logo = 'assets/login_screen_assets/Goaler_icon.jpg';
//   String? userInfo = ""; //user의 정보를 저장하기 위한 변수

//   TodoModel todoModel = TodoModel();
//   TodoFirebaseModel todoFirebaseModel = TodoFirebaseModel();
//   static const storage =
//       FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업

//   @override
//   void initState() {
//     super.initState();
//     //비동기로 flutter secure storage 정보를 불러오는 작업.
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _asyncMethod();
//     });
//   }

//   _asyncMethod() async {
//     todoModel.initAuthSystem();
//     //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
//     //(데이터가 없을때는 null을 반환을 합니다.)
//     userInfo = await storage.read(key: "login");
//     print(userInfo);

//     //user의 정보가 있다면 바로 Todo 페이지로 넝어가게 합니다.
//     if (userInfo != null) {
//       print('자동 로그인 성공');
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const TodoScreen(),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(backgroundImage),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.transparent,
//                     Colors.black,
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 28.0, right: 28, bottom: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Center(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(
//                           width: 70,
//                           height: 70,
//                           child: ClipOval(
//                             child: Image.asset(logo),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         const Text(
//                           '체크리스트를 모두\n채우는 그날까지.',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 32,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 100),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     spacing: 10.0,
//                     children: [
//                       CustomButton(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SignUpScreen(),
//                             ),
//                           );
//                         },
//                         title: '가입하기',
//                         containerColor: Colors.white,
//                         textColor: Colors.black,
//                         isBordered: false,
//                         isLogoRequired: false,
//                         logoImage: '',
//                       ),
//                       CustomButton(
//                         onTap: () {},
//                         title: 'Google로 계속하기',
//                         containerColor: Colors.transparent,
//                         textColor: Colors.white,
//                         isBordered: true,
//                         isLogoRequired: true,
//                         logoImage:
//                             'assets/login_screen_assets/login_mathod_icons/Google_logo.png',
//                       ),
//                       CustomButton(
//                         onTap: () {},
//                         title: 'Facebook으로 계속하기',
//                         containerColor: Colors.transparent,
//                         textColor: Colors.white,
//                         isBordered: true,
//                         isLogoRequired: true,
//                         logoImage:
//                             'assets/login_screen_assets/login_mathod_icons/Facebook_logo.png',
//                       ),
//                       CustomButton(
//                         onTap: () {},
//                         title: 'Apple로 계속하기',
//                         containerColor: Colors.transparent,
//                         textColor: Colors.white,
//                         isBordered: true,
//                         isLogoRequired: true,
//                         logoImage:
//                             'assets/login_screen_assets/login_mathod_icons/Apple_logo.png',
//                       ),
//                       CustomButton(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => LoginScreen(),
//                             ),
//                           );
//                         },
//                         title: '로그인하기',
//                         containerColor: Colors.transparent,
//                         textColor: Colors.white,
//                         isBordered: false,
//                         isLogoRequired: false,
//                         logoImage: '',
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
