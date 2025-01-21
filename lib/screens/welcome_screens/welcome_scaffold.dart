import 'package:flutter/material.dart';
import 'package:flutter_mastering/models/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class WelcomeScaffold extends StatefulWidget {
  const WelcomeScaffold({
    super.key,
    required this.appName,
    required this.loginMathods,
  });

  final Widget appName;
  final Widget loginMathods;

  @override
  State<WelcomeScaffold> createState() => _WelcomeScaffoldState();
}

class _WelcomeScaffoldState extends State<WelcomeScaffold> {
  final String todoLoginBackgroundImage =
      'assets/welcome_screen_assets/todo_login_background.png';
  String? userInfo = ""; //user의 정보를 저장하기 위한 변수

  static const storage =
      FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업

  @override
  void initState() {
    super.initState();
    // 비동기로 flutter secure storage 정보를 불러오는 작업.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  Future<void> checkLoginStatus() async {
    bool isLoginSuccess = await context.read<LoginModel>().getIsLoginSuccess();

    if (isLoginSuccess) {
      Navigator.pushNamed(context, '/todo_screen');
    } else {
      debugPrint('로그인 실패...');
    }
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    userInfo = await storage.read(key: "login");
    debugPrint('welcome: $userInfo');

    //user의 정보가 있다면 login 메소드 호출
    if (userInfo != null) {
      debugPrint(userInfo!.split(" ")[1]);
      debugPrint(userInfo!.split(" ")[3]);

      context.read<LoginModel>().login(
            userInfo!.split(" ")[1],
            userInfo!.split(" ")[3],
          );
      checkLoginStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(todoLoginBackgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                widget.appName,
                widget.loginMathods,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
