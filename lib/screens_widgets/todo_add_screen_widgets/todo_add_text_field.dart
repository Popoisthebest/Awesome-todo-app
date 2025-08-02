import 'package:flutter/material.dart';
import 'package:flutter_mastering/screens/login_screens/widgets/custom_text_form_field.dart';
import 'package:flutter_mastering/screens/todo_screens/widgets/todo_custom_button.dart';

class TodoAddTextField extends StatelessWidget {
  TodoAddTextField({super.key});

  final TextEditingController addTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextFormField(
          title: '제목',
          hintText: '제목을 입력해 주세요.',
          isIcon: false,
          icon: const Icon(Icons.abc),
          isPassword: false,
          textEditingController: addTextEditingController,
        ),
        GestureDetector(
          onTap: () {
            print(addTextEditingController.text);
          },
          child: const TodoCustomButton(
            isBorder: false,
            title: '추가하기',
            color: Colors.black,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
