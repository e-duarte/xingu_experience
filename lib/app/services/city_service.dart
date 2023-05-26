import 'package:xingu_experience/app/models/city.dart';
import 'package:xingu_experience/app/models/package.dart';
import 'package:xingu_experience/app/models/service.dart';

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
            packages: [
              Package(
                id: 1,
                title: '1 dia de pesca esportiva',
                organizer: 'Pedro Guia de Pesca',
                category: 'Pesca esportiva',
                avaluation: 5,
                price: 400,
                coverPhoto:
                    'https://media.istockphoto.com/id/1092160614/pt/foto/fisherman-with-rod-spinning-reel-on-the-river-bank-sunrise-fishing-for-pike-perch-carp-fog.jpg?s=612x612&w=0&k=20&c=Voi6veju6VFz1MHJMOcItH9YunBcuCQU52zeL0S3m1g=',
                photos: [
                  'assets/images/pedro_1.png',
                  'assets/images/pedro_2.png',
                  'assets/images/pedro_3.png'
                ],
              ),
              Package(
                id: 2,
                title: '2 dia de pesca esportiva',
                organizer: 'Yure Guia de Pesca',
                category: 'Pesca esportiva',
                avaluation: 3,
                price: 600,
                coverPhoto:
                    'https://media.istockphoto.com/id/479040586/pt/foto/pescador-moldagem-fora-sua-linha.jpg?s=612x612&w=0&k=20&c=JfpsRsGYiOx7-O-7ul2WNNhLkUdHda3itXHCc-6RAoo=',
                photos: [],
              ),
              Package(
                id: 3,
                title: '2 dia de pesca esportiva',
                organizer: 'Yure Guia de Pesca',
                category: 'Pesca esportiva',
                avaluation: 3,
                price: 600,
                coverPhoto:
                    'https://media.istockphoto.com/id/479040586/pt/foto/pescador-moldagem-fora-sua-linha.jpg?s=612x612&w=0&k=20&c=JfpsRsGYiOx7-O-7ul2WNNhLkUdHda3itXHCc-6RAoo=',
                photos: [],
              ),
            ],
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

    await Future.delayed(const Duration(seconds: 1));
    return cities;
  }

  // Future<City> getByName(String city) {}
}
