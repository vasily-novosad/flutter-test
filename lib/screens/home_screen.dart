import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/button/button.dart';
import 'package:go_router/go_router.dart';
// import ''

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goToTransfers() => context.go('/transfers');

    viewTheTransfer(String id) => () => context.go('/home/transfer/$id');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text('Home Screen'),
              Button(
                text: 'Go to Transfers',
                onPressed: goToTransfers,
              ),
              Button(
                text: 'View the transfer 7',
                onPressed: viewTheTransfer('7'),
              ),
              Button(
                text: 'View the transfer 15',
                onPressed: viewTheTransfer('15'),
              )
            ],
          )
        ],
      ),
    );
  }
}
