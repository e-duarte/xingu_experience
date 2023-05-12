import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Xingu Experience'),
        ),
        body: Center(
          child: Container(
            child: const Text('Welcome to Xingu Experience App'),
          ),
        ));
  }
}
