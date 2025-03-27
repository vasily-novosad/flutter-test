import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/button/button.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Button(
          text: 'Get order info',
          onPressed: () {
            print('to fetch');
          }),

      Text('order #<the number will be here>'),
    ]);
  }
}
//
// class OrderInfoViewModel {
//   bool _isLoading = false;
//   Order? _order;
//
//   bool get isLoading => _isLoading;
//
//   Order? get order => _order;
//
//   Future<void> fetchOrderInfo(String orderID, String? token) async {
//     _isLoading = true;
//     notifyListeners();
//
//     Map<String, dynamic> variables = {
//       'id': orderID,
//     };
//
//     GraphQLResponse response = await GraphQL().request(
//       headers: token != null
//           ? {
//         'authorization': 'Bearer $token',
//       }
//           : null,
//       query: query,
//       operationName: operationName,
//       variables: variables,
//     );
//     if (response.errors != null) {
//       String message =
//       response.errors!.isNotEmpty ? response.errors![0].message! : '';
//
//       _isLoading = false;
//       notifyListeners();
//
//       throw HttpException(message);
//     }
//
//     if (response.data != null && response.data['orders']['order'] != null) {
//       _order = Order.fromJSON(response.data['orders']['order']);
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

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
