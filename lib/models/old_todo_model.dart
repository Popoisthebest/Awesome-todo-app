import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OldTodoModel with ChangeNotifier {
  Map<String, dynamic> _todoList = {};
  int _id = 0;
  bool _dataExist = false;

  late String _userName = '';
  late String _userUid = '';

  // _todoList Getter
  Map<String, dynamic> get getTodoList => _todoList;
  // _dataExist Getter
  bool get getDataExist => _dataExist;

  // _userName Getter
  String get getUserName => _userName;

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
          debugPrint('userName: $_userName, userUid: $_userUid');
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

  void initAuthSystem() {
    getUserNames();
    getTodos();
  }

  // 실시간 할 일 데이터 읽기
  Future<void> getTodos() async {
    await getUserNames();
    // _userUid 값 검증
    if (_userUid.isEmpty) {
      debugPrint('Error: _userUid is null or empty. Cannot fetch todos.');
    } else {
      // Firestore 실시간 데이터 가져오기
      FirebaseFirestore.instance
          .collection('할 일 상자')
          .doc(_userUid)
          .snapshots()
          .listen(
        (event) {
          // Firestore 문서가 존재하고, 데이터가 비어 있지 않을 경우
          if (event.exists &&
              event.data() != null &&
              event.data()!.isNotEmpty) {
            _dataExist = true; // 데이터 존재 여부를 true로 설정
            _todoList = event.data()!; // Firestore 데이터 저장
            _id = int.parse(event.data()!.keys.last) + 1; // 새로운 ID 계산
            debugPrint(_todoList.toString());
            debugPrint('todoList 불러오기 성공');
          } else {
            // 데이터가 없거나 문서가 비어 있을 경우
            _todoList = {}; // 빈 Map으로 초기화
            _dataExist = false; // 데이터 없음 표시
            debugPrint('Data is not exist in Firestore.');
          }
          notifyListeners(); // UI 업데이트
        },
        onError: (error) {
          // 오류 발생 시 처리
          debugPrint('Firestore error: $error');
        },
      );
    }
  }

  // 정적 데이터 읽기
  // docRef.get().then(
  //   (DocumentSnapshot doc) {
  //     final data = doc.data() as Map<String, dynamic>;
  //     if (data.isNotEmpty) {
  //       _todoList = data;
  //       _id = int.parse(data.keys.last) + 1;
  //       notifyListeners();
  //     } else {
  //       debugPrint('data is not exist');
  //     }
  //   },
  //   onError: (e) => debugPrint("Error getting document: $e"),
  // );

  // _userDataExist = false;

  // Todo 추가
  void addTodo(String todo) {
    // todoList에 Todo추가
    _todoList.addAll({
      _id.toString(): {todo: false}
    });

    _id++;
    // Firebase에 Todo업데이트
    FirebaseFirestore.instance
        .collection('할 일 상자')
        .doc(_userUid)
        .set(_todoList);

    notifyListeners();
  }

  // 특정 Todo삭제
  void deleteTodo(String id) {
    _todoList.remove(id);
    // Firebase에 Todo업데이트
    FirebaseFirestore.instance
        .collection('할 일 상자')
        .doc(_userUid)
        .set(_todoList);

    notifyListeners();
  }

  // 모든 Todo삭제
  void deleteAllTodos() {
    _todoList.clear();
    // Firebase에 Todo업데이트
    FirebaseFirestore.instance
        .collection('할 일 상자')
        .doc(_userUid)
        .set(_todoList);

    notifyListeners();
  }

  // 완료 상태 변경
  void onCompletedClick(String id) {
    if (_todoList.containsKey(id)) {
      // 해당 ID의 할 일을 가져옴
      String todoKey = _todoList[id]!.keys.first;
      bool currentStatus = _todoList[id]![todoKey]!;

      // 완료 상태 반전
      _todoList[id] = {todoKey: !currentStatus};
      notifyListeners(); // 변경 사항 알림
    }
  }
}
