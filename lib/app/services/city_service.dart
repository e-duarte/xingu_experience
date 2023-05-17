import 'package:xingu_experience/app/models/city.dart';
import 'package:xingu_experience/app/models/service.dart';
import 'dart:io';

class CityService {
  Future<List<City>> all() async {
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

    await Future.delayed(const Duration(seconds: 5));
    return cities;
  }

  // Future<City> getByName(String city) {}
}
