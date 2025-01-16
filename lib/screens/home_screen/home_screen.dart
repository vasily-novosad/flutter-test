import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/screens/home_screen/order_info.dart';
import 'package:flutter_test_app/services/cache_manager.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('>>>>>>> Home render');

    void displaySheet() {
      showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              title: const Text('Title'),
              message: const Text('Message'),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    print('ok');
                    Navigator.pop(context);
                  },
                  child: Text('Item 1'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    print('ok');
                    Navigator.pop(context);
                  },
                  child: Text('Item 2'),
                ),
                CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    print('ok');
                    Navigator.pop(context);
                  },
                  child: Text('Dismiss'),
                ),
              ],
            );
          });
    }

    return CupertinoScrollbar(
      child: Center(
        child: Builder(builder: (context) {
          return Column(
            children: [
              OrderInfo(),
              Button(text: 'Display sheet', onPressed: displaySheet),
              Button(
                  text: 'Go to Login screen',
                  onPressed: () {
                    context.go('/login');
                  }),
              Button(
                  text: 'Clear cache',
                  onPressed: () {
                    StorageManager().deleteStore();
                  }),
            ],
          );
        }),
      ),
    );
  }
}
