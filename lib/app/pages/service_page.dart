import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xingu_experience/app/models/city.dart';
import 'package:xingu_experience/app/models/cities_state.dart';
import 'package:xingu_experience/app/models/service.dart';
import 'package:xingu_experience/app/widgets/cards.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  final double rightPadding = 15;
  final double leftPadding = 15;
  final double topPadding = 10;
  final double bottomPadding = 15;

  @override
  Widget build(BuildContext context) {
    final City city = Provider.of<CitiesState>(context, listen: false).city;
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
      body: SizedBox(
        // color: Colors.amber,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(
                right: rightPadding,
                left: leftPadding,
                bottom: bottomPadding,
                top: topPadding,
              ),
              child: const Text(
                'Pacotes de Pesca',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              // color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.31,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...service.packages.map(
                    (p) => PackageCard(
                      coverPhoto: p.coverPhoto,
                      title: p.title,
                      evaluation: p.avaluation,
                      organizer: p.organizer,
                      price: p.price,
                      callback: () {
                        Navigator.pushNamed(
                          context,
                          '/packagepage',
                          arguments: {
                            'service': service.name,
                            'package_id': p.id,
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                right: rightPadding,
                left: leftPadding,
                bottom: bottomPadding,
                top: topPadding,
              ),
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
              padding: EdgeInsets.only(
                right: rightPadding,
                left: leftPadding,
                top: bottomPadding,
              ),
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
