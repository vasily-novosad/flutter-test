import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/screens/login_screen/token_requester.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
       navigationBar: MyAppbar(Text('Home')).getAppBar(context),
      // appBar: MyAppbar(Text('Login screen')).getAppBar(context),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [TokenRequester()],
        ),
      ),
    );
  }
}
