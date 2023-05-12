import 'package:flutter/material.dart';
import 'package:xingu_experience/app/pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xingu Experience',
      locale: const Locale('pt'),
      // theme: ThemeData(primarySwatch: colorCustom),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
      },
    );
  }
}
