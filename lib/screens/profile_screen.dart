import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/widgets/button.dart';
import 'package:flutter_test_app/widgets/confirm_sheet.dart';
import 'package:flutter_test_app/widgets/safe_frame.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyAppbar(title: 'Константин Константинопольский'),
        Expanded(
          child: SafeFrame(
            children: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      fit: BoxFit.cover,
                      'assets/photos/profile-photo.png',
                      width: 140,
                      height: 140,
                    ),
                    SizedBox(width: 10),
                    Text(
                      maxLines: 4,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      'Константин\nКонстантинопольски',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Button(
                      text: 'Сменить пароль',
                      onTap: () => context.go('/home/profile/password-change'),
                    ),
                    SizedBox(width: 10),
                    Button(
                      text: 'Выйти из системы',
                      onTap: () {
                        ConfirmSheet.show(
                            context: context,
                            text: Text('Выйти из системы?'),
                            onDone: () {
                              context.go('/home');

                              Fluttertoast.showToast(
                                msg: "Имитируем выход из системы",
                                // toastLength: Toast.LENGTH_SHORT,
                                // gravity: ToastGravity.CENTER,
                                // timeInSecForIosWeb: 1,
                                // backgroundColor: Colors.red,
                                // textColor: Colors.white,
                                // fontSize: 16.0
                              );
                              // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              //   content: Text("Имитируем выход из системы"),
                              // ));
                            });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
