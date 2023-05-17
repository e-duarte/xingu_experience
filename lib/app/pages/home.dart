import 'package:flutter/material.dart';
import 'package:xingu_experience/app/models/city.dart';
import 'package:xingu_experience/app/models/service.dart';
import 'package:xingu_experience/app/widgets/buttons.dart';
import 'package:xingu_experience/app/widgets/service_card.dart';

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
      services: [
        Service(
          name: 'Pesca',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
          photos: [],
          packages: [],
          cardTitle: 'Explore a pesca na região',
          cardDescription:
              'Encontre os melhores pontos de pesca com os nossos guias parceiros',
          coverPhoto:
              'https://fishingbooker.com/blog/media/2023/04/Walleye-hooked.jpg',
        ),
        Service(
          name: 'Pesca',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
          photos: [],
          packages: [],
          cardTitle: 'Explore a pesca na região',
          cardDescription:
              'Encontre os melhores pontos de pesca com os nossos guias parceiros',
          coverPhoto:
              'https://fishingbooker.com/blog/media/2023/04/Walleye-hooked.jpg',
        ),
        Service(
          name: 'Pesca',
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
          photos: [],
          packages: [],
          cardTitle: 'Explore a pesca na região',
          cardDescription:
              'Encontre os melhores pontos de pesca com os nossos guias parceiros',
          coverPhoto:
              'https://fishingbooker.com/blog/media/2023/04/Walleye-hooked.jpg',
        )
      ],
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
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cities[index].coverPhoto),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
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
            ),
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
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
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
              child: const Text(
                'EXPLORAR',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ...cities[index].services.map(
                  (e) => Container(
                    // color: Colors.blue,
                    padding:
                        const EdgeInsets.only(right: 15, left: 15, bottom: 10),
                    child: ServiceCard(
                      title: e.cardTitle,
                      subtitle: e.cardDescription,
                      coverPhoto: e.coverPhoto,
                      callback: () {},
                    ),
                  ),
                ),
          ],
        ),
      ),
    ));
  }
}
