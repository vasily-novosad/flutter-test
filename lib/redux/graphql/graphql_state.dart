class GraphQlState {
  late String _endpoint = 'https://crm.bio-transfer.ru/graphql';
  late String _subscription = 'wss://crm.bio-transfer.ru/subscriptions';

  String get endpoint => _endpoint;
  String get subscription => _subscription;

  GraphQlState({
    String? endpoint,
    String? subscription,
  }) {
    _endpoint = endpoint ?? _endpoint;
    _subscription = subscription ?? _subscription;
  }

  GraphQlState copyWith({
    String? endpoint,
    String? subscription,
  }) {
    return GraphQlState(
      endpoint: endpoint ?? _endpoint,
      subscription: subscription ?? _subscription,
    );
  }
}
