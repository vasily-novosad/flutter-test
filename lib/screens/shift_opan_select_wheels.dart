import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets/base_button.dart';
import 'package:go_router/go_router.dart';

import '../components/appbar/appbar.dart';
import '../widgets/safe_frame.dart';

class ShiftOpenSelectWheelsScreen extends StatelessWidget {
  const ShiftOpenSelectWheelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeFrame(
      children: Column(
        children: [
          MyAppbar(
            title: 'Transfers list',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'На какой машине работаете?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  VehicleItem(
                    num: 'FB 445',
                    title: 'ISUZU x5000',
                    imagePath: 'assets/photos/truck-01.png',
                  ),
                  SizedBox(height: 10),
                  VehicleItem(
                    num: 'FB 445',
                    title: 'ISUZU x5000',
                    imagePath: 'assets/photos/truck-02.png',
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VehicleItem extends StatelessWidget {
  final String title;
  final String num;
  final String imagePath;


  const VehicleItem({
    super.key,
    required this.title,
    required this.num,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      child: Row(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  num,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      onTap: () {
        context.go('/home/shift-open/photos');
      },
    );
  }
}
