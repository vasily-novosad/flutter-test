import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final String variable;

  const LoadingIndicator({super.key, required this.variable});

  @override
  State<StatefulWidget> createState() => _LoadingIndicator();
}

class _LoadingIndicator extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.variable),
    );
  }
}