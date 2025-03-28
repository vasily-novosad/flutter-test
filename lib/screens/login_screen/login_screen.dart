import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/components/login_form/login_form.dart';
import 'package:flutter_test_app/models/authentication_model.dart';
import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/screens/login_screen/token_informer.dart';
import 'package:flutter_test_app/services/storage_manager.dart';
import 'package:go_router/go_router.dart';

import 'login_screen_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StorageManager storage = StorageManager(mode: StorageManagerMode.app);
    LoginScreenViewModel viewModel = LoginScreenViewModel(context);

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginForm(),
            Button(
                text: 'Go to home screen',
                onPressed: () {
                  GoRouter.of(context).go('/profile');
                }),
            Builder(builder: (_) {
              return Text('just example');
            }),
            TokenInformer(),
            Builder(builder: (context) {
              if (viewModel.isFetching) {
                return CircularProgressIndicator();
              }

              return Button(
                text: viewModel.autologinButtonLabel,
                onPressed: () => viewModel.autologinButtonPress(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
