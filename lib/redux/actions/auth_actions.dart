class SetTokenAction {
  final String token;

  const SetTokenAction(this.token);
}

class SetAuthAction {
  final String token;
  final String userID;
  final String userName;

  const SetAuthAction({
    required this.token,
    required this.userID,
    required this.userName,
  });
}

class SetPendingAction {
  final bool isPending;

  const SetPendingAction(this.isPending);
}
