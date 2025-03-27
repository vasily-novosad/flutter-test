import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/redux/app/app_state.dart';
import 'package:flutter_test_app/screens/login_screen/token_informer_view_model.dart';

class TokenInformer extends StatelessWidget {
  const TokenInformer({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TokenInformerViewModel>(
      converter: (store) =>
          TokenInformerViewModel(store.state.auth.accessToken),
      distinct: true,
      builder: (context, viewModel) {
        return Text(viewModel.token);
      },
    );
  }
}
