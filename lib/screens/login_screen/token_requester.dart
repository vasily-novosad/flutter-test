import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/graphql/types/token_bag.dart';
import 'package:flutter_test_app/models/authentification_model.dart';
import 'package:flutter_test_app/providers/counter_provider.dart';
import 'package:flutter_test_app/redux/actions/auth_actions.dart';
import 'package:flutter_test_app/screens/login_screen/counter_value.dart';
import 'package:flutter_test_app/services/authenticator.dart';
import 'package:flutter_test_app/services/storage.dart';
import 'package:flutter_test_app/redux/states/app_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

typedef OnSaveCallback = void Function(String task, String note);

// final snackBar = SnackBar(
//   content: Text('Wait...'),
//   action: SnackBarAction(
//       label: 'Close',
//       onPressed: () {
//         // ..
//       }),
// );

class TokenRequester extends StatefulWidget {
  const TokenRequester({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TokenRequester();
  }
}

class _TokenRequester extends State<TokenRequester> {
  bool _loading = false;

  void _incCounter() {
    Provider.of<CounterProvider>(context, listen: false).incrementCounter();
    // AuthProvider().
    // Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSaveCallback>(
        builder: (context, callback) {
      return _loading
          ? Text('Loading...')
          : Column(children: [
              CounterValue(),
              Button(
                  text: 'Increment counter',
                  onPressed: () {
                    _incCounter();
                  }),
              Button(
                  text: "Token request action",
                  onPressed: () {
                    callback('t', 'n');
                  },
                  disabled: _loading),
            ]);
    }, converter: (store) {
      return (String task, String note) {
        // ScaffoldMessengerState scaffoldMessenger =
        //     ScaffoldMessenger.of(context);

        // scaffoldMessenger.showSnackBar(snackBar);
        setState(() {
          _loading = true;
        });

        // AuthentificationModel(store).requestAuthorization(login, password);

        Auth().auth(login: 'dev', password: 'dev').then((response) async {
          // scaffoldMessenger.hideCurrentSnackBar();
          StorageAction storage = await Storage().getStorage();

          setState(() {
            _loading = false;
          });

          if (response.success != null) {
            TokenBag? tokenBag = response.success?.payload;

            if (tokenBag != null) {
              store.dispatch(SetTokenAction(tokenBag.token));

              storage.setItem('@token', tokenBag.token);
            }

            if (context.mounted) {
              context.go('/profile');
            }

            return;
          }

          if (response.error != null) {
            String errorMsg = response.error?.msg ?? 'Unknown Error';
            // SnackBar errorSnack = SnackBar(
            //     content: Text(errorMsg), backgroundColor: Color(0xff880101));
            // scaffoldMessenger.showSnackBar(errorSnack);
            // store.dispatch(SetTokenAction(AuthState.initialState().token));

            storage.removeItem('@token');
          }
        });
      };
    });
  }
}
