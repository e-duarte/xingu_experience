import 'package:flutter/material.dart';
import 'package:xingu_experience/app/models/city.dart';
import 'package:xingu_experience/app/widgets/buttons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<City> cities = [
    City(
      city: 'Altamira',
      state: 'Pará',
      descripition:
          'Vitória do xingu é uma cidade do interior do estado do pará. Nela é sediada a terceira maior hidrelétrica do brasil, Usina de Belo Monte',
      coverPhoto: 'foto',
      photos: [],
      services: [],
    ),
    City(
      city: 'Vitória do Xingu',
      state: 'Pará',
      descripition:
          'Vitória do xingu é uma cidade do interior do estado do pará. Nela é sediada a terceira maior hidrelétrica do brasil, Usina de Belo Monte',
      coverPhoto:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Rio_Xingu%2C_Vit%C3%B3ria_do_Xingu_-_Par%C3%A1.jpg/1024px-Rio_Xingu%2C_Vit%C3%B3ria_do_Xingu_-_Par%C3%A1.jpg',
      photos: [],
      services: [],
    ),
    City(
      city: 'Senador José Porfírio',
      state: 'Pará',
      descripition:
          'Vitória do xingu é uma cidade do interior do estado do pará. Nela é sediada a terceira maior hidrelétrica do brasil, Usina de Belo Monte',
      coverPhoto: 'foto',
      photos: [],
      services: [],
    )
  ];

  int index = 1;

  Widget bar() {
    return SizedBox(
      // color: Colors.greenAccent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            width: 7.0,
          ),
          CircleButton(iconPath: 'assets/icons/map.png', callback: () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.topRight,
              child: IconButton(
                onPressed: () {},
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

  Widget cityName() {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cities[index].state.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              cities[index].city.toUpperCase(),
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
            callback: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          AdditionalServiceButton(
            iconPath: 'assets/icons/restaurant.png',
            text: 'Restaurantes',
            backgroundColor: 0xFF41A852,
            callback: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          AdditionalServiceButton(
            iconPath: 'assets/icons/event.png',
            text: 'Eventos',
            backgroundColor: 0xFF45C6EF,
            callback: () {},
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
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.network(
                      cities[index].coverPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: bar(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: cityName(),
                      ),
                      Expanded(
                        child: Container(
                          child: additionalServices(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
              // color: Colors.amber,
              // height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            cities[index].descripition,
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
                          callback: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
