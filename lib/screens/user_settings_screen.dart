import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/themes/main/colors.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppbar(title: 'User Settings'),
        Expanded(
          child: SingleChildScrollView(child: Container(
            margin: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: ThemeColors.bottomBarBackground,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your username',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(

                        'Your department',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(height: 20),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
