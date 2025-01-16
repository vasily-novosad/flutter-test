import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/models/authentification_model.dart';
import 'package:flutter_test_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LogoutButtonViewModel {
  final BuildContext context;
  late AuthProvider authProvider;
  late AuthentificationModel authModel;

  LogoutButtonViewModel(this.context) {
    authProvider = Provider.of<AuthProvider>(context);
    authModel = AuthentificationModel(context);
  }

  Text get label {
    String label = authProvider.hasToken ? 'Logout' : 'Not logged';

    return Text(label);
  }

  bool get shouldBeDisplayed => authProvider.hasToken;

  void clickAction() {
    if (!authProvider.hasToken) {
      return;
    }

    authModel.resetToken();
  }
}
