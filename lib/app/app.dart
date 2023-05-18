import 'package:flutter/material.dart';
import 'package:xingu_experience/app/pages/event_page.dart';
import 'package:xingu_experience/app/pages/home_page.dart';
import 'package:xingu_experience/app/pages/hotel_page.dart';
import 'package:xingu_experience/app/pages/restaurant_page.dart';
import 'package:xingu_experience/app/pages/service_page.dart';
import 'package:xingu_experience/app/pages/user_page.dart';

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
        '/home': (context) => const HomePage(),
        '/userpage': (context) => const UserPage(),
        '/hotelpage': (context) => const HotelPage(),
        '/restaurantpage': (context) => const RestaurantPage(),
        '/eventpage': (context) => const EventPage(),
        '/servicepage': (context) => const ServicePage(),
      },
    );
  }
}
