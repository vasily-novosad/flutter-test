import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';
import 'package:flutter_test_app/screens/home_screen/token_informer/token_informer_view_model.dart';

class TokenInformer extends StatelessWidget {
  const TokenInformer({super.key});

  void displayMessagebox(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Cussess'),
            content: Text('Authorization is done'),
            actions: [
              CupertinoDialogAction(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TokenInformerViewModel>(
      converter: (store) => TokenInformerViewModel(store),
      builder: (context, vm) {
        final bool isPending = vm.isPending;
        final String? token = vm.token;

        return Button(
            text: isPending
                ? 'wait...'
                : vm.hasToken
                    ? 'token $token...'
                    : 'no token',
            onPressed: () {
              if (!vm.hasToken) {
                vm.requestAuthorization('dev', 'dev').then((_) {
                  if (context.mounted) {
                    displayMessagebox(context);
                  }
                });
              } else {
                vm.resetToken();
              }
            });
      },
    );
  }
}
