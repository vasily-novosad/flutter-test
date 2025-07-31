import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/widgets/button.dart';
import 'package:flutter_test_app/widgets/confirm_sheet.dart';
import 'package:flutter_test_app/widgets/safe_frame.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileChangePasswordScreen extends StatelessWidget {
  const ProfileChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyAppbar(title: 'Смена пароля'),
        Expanded(
          child: SafeFrame(
            children: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Форма смены пароль пользователя. После успешного сохранения данных он возвращается обратно на экран профиля',
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Введите новый пароль',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Повторите пароль',
                    ),
                  ),
                  SizedBox(height: 10),
                  Button(
                    text: 'Сохранить изменения',
                    onTap: () {
                      ConfirmSheet.show(
                          context: context,
                          text: Text('Подтвердите действие'),
                          onDone: () {
                            Navigator.of(context).pop();

                            Fluttertoast.showToast(
                                msg: "Пароль успешно изменен",
                                // toastLength: Toast.LENGTH_SHORT,
                                // gravity: ToastGravity.CENTER,
                                // timeInSecForIosWeb: 1,
                                // backgroundColor: Colors.red,
                                // textColor: Colors.white,
                                // fontSize: 16.0
                            );
                          });

                      // Navigator.pop(context)
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
