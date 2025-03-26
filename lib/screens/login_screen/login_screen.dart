import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/models/authentification_model.dart';
import 'package:flutter_test_app/providers/auth_provider.dart';
import 'package:flutter_test_app/components/login_form/login_form.dart';
import 'package:flutter_test_app/services/storage_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StorageManager storage = StorageManager(mode: StorageManagerMode.app);

    return Scaffold(
      appBar: MyAppbar(Text('Login screen')).of(context),
      body: SingleChildScrollView(
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
              Builder(builder: (context) {
                // String? str = Provider.of<AuthProvider>(context).tokenValue;
                String? str = _LoginScreenViewModel(context).token;

                return Text(str ?? 'no token');
              }),
              Consumer<AuthProvider>(builder: (context, viewModel, _) {
                final String label =
                    viewModel.tokenValue != null ? 'Logout' : 'Autologin';

                if (viewModel.isFetching) {
                  return CircularProgressIndicator();
                }

                return Button(
                    text: label,
                    onPressed: () async {
                      if (viewModel.tokenValue != null) {
                        AuthentificationModel(context).resetToken();
                        Provider.of<AuthProvider>(context, listen: false)
                            .setToken(null);
                        await storage.clear('@token');
                        viewModel.setToken(null);

                        return;
                      }

                      viewModel.setDataFetchingState(true);
                      AuthentificationModel(context)
                          .requestAuthorization('dev', 'dev')
                          .then((maybeToken) {
                        viewModel.setToken(maybeToken);
                      });
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginScreenViewModel {
  final BuildContext context;
  late AuthentificationModel authModel;

  _LoginScreenViewModel(this.context) {
    authModel = AuthentificationModel(context);
  }

  bool get isFetching =>
      Provider.of<AuthProvider>(context, listen: false).isFetching;

  String? get token => Provider.of<AuthProvider>(context).tokenValue;

  Future<void> requestAuthorization(String login, String password) async {
    AuthProvider provider = Provider.of<AuthProvider>(context, listen: false);
    provider.setDataFetchingState(true);
    String? token = await authModel.requestAuthorization(login, password);
    provider.setToken(token);
  }

  Future<void> resetToken() async {
    authModel.resetToken();
  }
}
