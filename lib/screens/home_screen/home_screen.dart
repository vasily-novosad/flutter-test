import 'package:flutter/cupertino.dart';
// import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/components/logout_button/logout_button_widget.dart';
import 'package:flutter_test_app/providers/counter_provider.dart';
import 'package:flutter_test_app/screens/home_screen/counter_btn.dart';
import 'package:flutter_test_app/screens/home_screen/token_informer/token_informer_widget.dart';
import 'package:provider/provider.dart';

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
              TokenInformer(),
              LogoutButton(),
              CounterView(),
              CounterButton(),
              Button(text: 'Display sheet', onPressed: displaySheet),
            ],
          );
        }),
      ),
    );
  }
}
