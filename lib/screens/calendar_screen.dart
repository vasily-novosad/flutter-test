import 'package:flutter/material.dart';
import 'package:flutter_test_app/themes/main/colors.dart';
import 'package:flutter_test_app/widgets/base_button.dart';
import 'package:go_router/go_router.dart';

import '../components/appbar/appbar.dart';
import '../widgets/safe_frame.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeFrame(
      children: Column(
        children: [
          MyAppbar(title: 'Мои смены'),
          Expanded(
            child: Container(
              color: ThemeColors.bottomBarBackground,
              child: GridView.count(
                padding: EdgeInsets.all(10),
                // Create a grid with 2 columns.
                // If you change the scrollDirection to horizontal,
                // this produces 2 rows.
                crossAxisCount: 7,
                // Generate 100 widgets that display their index in the list.
                children: List.generate(30, (index) {
                  int num = index + 1;

                  return CalendarCell(num: num, onTap: (){
                    context.go('/transfers');
                  },
                  );
                }),
              ),
            )
          ),
        ],
      ),
    );
  }
}

class CalendarCell extends StatelessWidget {
  final int num;
  final VoidCallback? onTap;

  const CalendarCell({
    super.key,
    required this.num,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(num.toString()),
      ),
    );
  }
}
