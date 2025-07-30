import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/surface/surface.dart';
import 'package:flutter_test_app/themes/main/colors.dart';
import 'package:go_router/go_router.dart';

import '../components/appbar/appbar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppbar(title: 'Settings'),
        Expanded(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: Surface(
                  child: Column(
                    children: [
                      Text('Go to common settings'),
                      Container(margin: EdgeInsets.only(top: 20)),
                      Text(
                        'Proin lorem nunc, lobortis eget feugiat eget, pharetra ut arcu',
                        style: TextStyle(
                          color: ThemeColors.textPrimary.withAlpha(150),
                        ),
                      ),
                      Container(margin: EdgeInsets.only(top: 80)),
                      ElevatedButton(
                          onPressed: () => context.go('/menu/settings/common'),
                          child: Text('Setup it'))
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: Surface(
                  child: Column(
                    children: [
                      Text('Another settings'),
                      Container(margin: EdgeInsets.only(top: 20)),
                      Text(
                        'Vestibulum arcu turpis, pellentesque sit amet ante nec, volutpat aliquam orci. Cras sit amet blandit nunc, eu eleifend urna. Curabitur a hendrerit turpis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin lorem nunc, lobortis eget feugiat eget, pharetra ut arcu',
                        style: TextStyle(
                          color: ThemeColors.textPrimary.withAlpha(150),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: SizedBox(
                  child: Surface(
                      child: Column(
                    children: [
                      Text('User settings'),
                      Container(margin: EdgeInsets.only(top: 20)),
                      Text(
                        'Curabitur a hendrerit turpis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin lorem nunc, lobortis eget feugiat eget, pharetra ut arcu',
                        style: TextStyle(
                          color: ThemeColors.textPrimary.withAlpha(150),
                        ),
                      ),
                      Container(margin: EdgeInsets.only(top: 40)),
                      ElevatedButton(
                          onPressed: () => context.go('/menu/settings/user'),
                          child: Text('Setup it'))
                    ],
                  )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: SizedBox(
                  height: 180,
                  child: Surface(
                      child: Column(
                    children: [
                      Text('Application settings'),
                      Container(margin: EdgeInsets.only(top: 20)),
                      Text(
                        'Aenean ac sapien eget nisl maximus aliquet. Cras et enim ut neque posuere rhoncus. Aliquam rhoncus nisi sed metus mattis iaculis.',
                        style: TextStyle(
                          color: ThemeColors.textPrimary.withAlpha(150),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: SizedBox(
                  child: Surface(
                      child: Column(
                    children: [
                      Text('Notifications settings'),
                      Container(margin: EdgeInsets.only(top: 20)),
                      Text(
                        'Morbi vel justo magna. Sed hendrerit ullamcorper lorem quis cursus. Etiam facilisis nisi tellus, vel molestie.',
                        style: TextStyle(
                          color: ThemeColors.textPrimary.withAlpha(150),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: SizedBox(
                  child: Surface(
                      child: Column(
                    children: [
                      Text('Common settings'),
                      Container(margin: EdgeInsets.only(top: 20)),
                      Text(
                        'Ut scelerisque orci metus, nec iaculis odio imperdiet eu. Mauris ac justo metus. Phasellus bibendum ex id orci blandit vehicula.',
                        style: TextStyle(
                          color: ThemeColors.textPrimary.withAlpha(150),
                        ),
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
