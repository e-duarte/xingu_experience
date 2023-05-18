import 'package:flutter/material.dart';
import 'package:xingu_experience/app/models/city.dart';
import 'package:xingu_experience/app/services/city_service.dart';
import 'package:xingu_experience/app/widgets/buttons.dart';
import 'package:xingu_experience/app/widgets/service_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCity = 1;

  Future<List<City>> _getAllCities() async {
    List<City> cities = await CityService().all();
    return cities;
  }

  Widget bar(List<City> cities) {
    return SizedBox(
      // color: Colors.greenAccent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            width: 7.0,
          ),
          CircleButton(
            iconPath: 'assets/icons/map.png',
            callback: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Qual cidade você deseja explorar?'),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.separated(
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(cities[index].city),
                            onTap: () {
                              setState(() {
                                selectedCity = index;
                                Navigator.pop(context);
                              });
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/userpage');
                },
                icon: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/fotos-gratis/viajante-de-homem-com-mochila-montanhismo-viagens-conceito-de-estilo-de-vida_1150-9246.jpg'),
                ),
                iconSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cityName(City city) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              city.state.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              city.city.toUpperCase(),
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget additionalServices() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdditionalServiceButton(
            iconPath: 'assets/icons/hotel.png',
            text: 'Hotéis',
            backgroundColor: 0xFFFDB90B,
            callback: () {
              Navigator.pushNamed(context, '/hotelpage');
            },
          ),
          const SizedBox(
            width: 10,
          ),
          AdditionalServiceButton(
            iconPath: 'assets/icons/restaurant.png',
            text: 'Restaurantes',
            backgroundColor: 0xFF41A852,
            callback: () {
              Navigator.pushNamed(context, '/restaurantpage');
            },
          ),
          const SizedBox(
            width: 10,
          ),
          AdditionalServiceButton(
            iconPath: 'assets/icons/event.png',
            text: 'Eventos',
            backgroundColor: 0xFF45C6EF,
            callback: () {
              Navigator.pushNamed(context, '/eventpage');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: FutureBuilder<List<City>>(
            future: _getAllCities(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<City> cities = snapshot.data ?? [];

                return ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(cities[selectedCity].coverPhoto),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: bar(cities),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: cityName(cities[selectedCity]),
                          ),
                          Expanded(
                            child: Container(
                              child: additionalServices(),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(right: 30, left: 30, top: 20),
                      // height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                        children: [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    cities[selectedCity].descripition,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.justify,
                                    softWrap: false,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ReadMoreButton(
                                  backgroundColor: 0xFF000000,
                                  fontColor: 0xFFFFFFFF,
                                  callback: () {},
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.amber,
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, bottom: 10),
                      child: const Text(
                        'EXPLORAR',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ...cities[selectedCity].services.map(
                          (e) => Container(
                            // color: Colors.blue,
                            padding: const EdgeInsets.only(
                                right: 15, left: 15, bottom: 10),
                            child: ServiceCard(
                              title: e.cardTitle,
                              subtitle: e.cardDescription,
                              coverPhoto: e.coverPhoto,
                              callback: () {
                                Navigator.pushNamed(context, '/servicepage');
                              },
                            ),
                          ),
                        ),
                  ],
                );
              } else {
                return const Material(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
