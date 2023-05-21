import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xingu_experience/app/models/city.dart';
import 'package:xingu_experience/app/models/city_state.dart';
import 'package:xingu_experience/app/models/service.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final City city = Provider.of<CityState>(context, listen: false).city;
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    Service service =
        city.services.firstWhere((s) => s.name == arguments['service']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Text(
          city.city,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        // color: Colors.amber,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
              child: const Text(
                'Pacotes de Pesca',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
              child: Text(
                service.cardTitle,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(service.coverPhoto),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Image.network(),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
              child: Text(
                service.description,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
