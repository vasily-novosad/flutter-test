import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:flutter_test_app/graphql/types/order.dart';
import 'package:flutter_test_app/providers/auth_provider.dart';
import 'package:flutter_test_app/services/graphql.dart';
import 'package:provider/provider.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Button(
          text: 'Get order info',
          
          onPressed: () {
            String? token =
                Provider.of<AuthProvider>(context, listen: false).tokenValue;
            Provider.of<OrderInfoViewModel>(context, listen: false)
                .fetchOrderInfo('00013750-8c38-431d-b9b5-3adfe2e3a009', token);
          }),
      Consumer<OrderInfoViewModel>(builder: (_, model, __) {
        if (!model.isLoading) {
          return SizedBox();
        }

        return CupertinoActivityIndicator();
      }),
      Consumer<OrderInfoViewModel>(builder: (_, model, __) {
        final Order? order = model.order;

        if (order == null) {
          return Text('No order');
        }

        return Text('order #${order.number}');
      }),
      // Builder(builder: (context) {
      //   final Order? order =
      //       Provider.of<OrderInfoViewModel>(context, listen: true).order;

      //   if (order == null) {
      //     return SizedBox();
      //   }

      //   return Text('order #${order.number}');
      // }),
    ]);
  }
}

class OrderInfoViewModel extends ChangeNotifier {
  bool _isLoading = false;
  Order? _order;

  bool get isLoading => _isLoading;
  Order? get order => _order;

  Future<void> fetchOrderInfo(String orderID, String? token) async {
    _isLoading = true;
    notifyListeners();

    Map<String, dynamic> variables = {
      'id': orderID,
    };

    GraphQLResponse response = await GraphQL().request(
      headers: token != null
          ? {
              'authorization': 'Bearer $token',
            }
          : null,
      query: query,
      operationName: operationName,
      variables: variables,
    );
    if (response.errors != null) {
      print('has errors');

    }

    if (response.data != null && response.data['orders']['order'] != null) {
      _order = Order.fromJSON(response.data['orders']['order']);
    }

    _isLoading = false;
    notifyListeners();
  }
}

final String operationName = 'OrdersQuery';
final String query = r'''
  query OrdersQuery ($id: ID!) {
    orders {
      order(id: $id) {
        id
        number
      }
    }
  }
''';
