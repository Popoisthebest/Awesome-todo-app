import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataModel with ChangeNotifier {
  final bool _dataExist = false;
  String _userName = '';
  late String _userUid = '';

  // _dataExist Getter
  bool get getDataExist => _dataExist;

  // _userName Getter
  String get getUserName => _userName;
  // _userUid Gettter
  String get getUserUid => _userUid;

  Future<void> getUserNames() async {
    try {
      // Firebase Authentication에서 현재 사용자 가져오기
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final docRef =
            FirebaseFirestore.instance.collection('USER').doc(user.uid);

        // Firestore 문서 데이터 한 번 가져오기
        final snapshot = await docRef.get();

        if (snapshot.exists && snapshot.data() != null) {
          _userName = snapshot.data()!['userName'];
          _userUid = user.uid;
          debugPrint('UserDataModel userName: $_userName, userUid: $_userUid');
          notifyListeners();
        } else {
          debugPrint('Firestore 문서가 비어 있습니다.');
        }
      } else {
        debugPrint('User Data가 존재하지 않음 -> 로그인되지 않음.');
      }
    } catch (e) {
      debugPrint('Error in getUserNames: $e');
    }
  }
}
