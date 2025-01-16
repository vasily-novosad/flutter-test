

// import 'package:flutter_test_app/services/storage.dart';
// import 'package:flutter_test_app/redux/states/auth_state.dart';
// import 'package:flutter_test_app/redux/states/app_state.dart';

// class LoadedAppData {
//   final AppState state;
//   LoadedAppData({required this.state});
// }


// class AppLoader {
//   /// Loading data from the local storage and fill the Redux state
//   Future<LoadedAppData> loadApp() async {
//       StorageAction storage = await Storage().getStorage();
//       // AuthState initialAuthState = AppState.initialState().auth;
//       // UserState initialUserState = initialAuthState.user;
//       String token = storage.getItem('@token') ?? initialAuthState.token;

//       // UserState userState = UserState(id: initialUserState.id, name: initialUserState.name);
//       // AuthState authState = AuthState(token: token, user: userState);
//       AppState baseState = AppState(auth: authState);

//       return LoadedAppData(state: baseState);
//   }
// }