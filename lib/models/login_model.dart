import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginModel with ChangeNotifier {
  // 자동 로그인을 위한 보안 저장소에 로그인 정보 저장
  static const storage = FlutterSecureStorage();
  // 회원 관리 코드(회원가입, 로그인)
  final credential = FirebaseAuth.instance;

  Future<bool> getIsLoginSuccess() async {
    bool isLoginSuccess = true;
    debugPrint('로그인 모델 $isLoginSuccess');
    return isLoginSuccess;
  }

  void login(String email, password) async {
    // write 함수를 통하여 key에 맞는 정보를 적게 됩니다.
    //{"login" : "id id_value password password_value"}
    //와 같은 형식으로 저장이 된다고 생각을 하면 됩니다.
    await storage.write(key: "login", value: "email $email password $password");

    try {
      credential
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          debugPrint('로그인 모델 로그인 성공');
          getIsLoginSuccess();
          notifyListeners();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }
}
