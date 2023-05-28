import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xingu_experience/app/models/cities_state.dart';
import 'package:xingu_experience/app/models/city.dart';
import 'package:xingu_experience/app/models/package.dart';
import 'package:xingu_experience/app/models/service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:xingu_experience/app/widgets/evaluation.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  int sliderIndex = 0;
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
    Package package =
        service.packages.firstWhere((s) => s.id == arguments['package_id']);
    final double sliderHeigt = MediaQuery.of(context).size.height * 0.4;

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
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: sliderHeigt,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: sliderHeigt,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    sliderIndex = index;
                  });
                },
              ),
              itemCount: package.photos.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(package.photos[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Image.network(),
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: sliderIndex,
              count: package.photos.length,
              effect: const SlideEffect(
                activeDotColor: Colors.blue,
                dotWidth: 10.0,
                dotHeight: 10.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              right: rightPadding,
              left: leftPadding,
              // bottom: bottomPadding,
              // top: topPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  package.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Text(
                  package.category,
                  style: const TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  package.organizer,
                  style: const TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Row(
                  children: [
                    EvaluationIcon(evaluationPoints: package.avaluation),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${package.salesNumber} vendidos',
                          style: const TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${package.evaluationNumber} avaliações',
                          style: const TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    childAspectRatio: 1 / .2,
                    // scrollDirection: Axis.vertical,
                    children: [
                      Text(
                        'Duração: ${package.duration}',
                        style: const TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Idioma: ${package.idiom}',
                        style: const TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Cancelamento: ${package.cancel ? 'sim' : 'não'}',
                        style: const TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Local: ${package.location}',
                        style: const TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  package.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          EvaluationAndAskManager(
            packageId: package.id,
          ),
        ],
      ),
      bottomNavigationBar: BottomPackageBar(
        packagePrice: package.price,
        callback: () {},
      ),
    );
  }
}

typedef BottomBarCallback = void Function();

class BottomPackageBar extends StatelessWidget {
  const BottomPackageBar({
    required this.packagePrice,
    required this.callback,
    super.key,
  });

  final double packagePrice;
  final BottomBarCallback callback;
  final reservationButtonText = 'Reservar';
  final priceText = 'A partir de';

  @override
  Widget build(BuildContext context) {
    final double bottomHeight = MediaQuery.of(context).size.height * 0.1;
    final double leftPadding = MediaQuery.of(context).size.width * 0.03;
    final double rigthPadding = MediaQuery.of(context).size.width * 0.03;

    return BottomAppBar(
      // color: Colors.indigo,
      child: Container(
        height: bottomHeight,
        padding: EdgeInsets.only(left: leftPadding, right: rigthPadding),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        priceText,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'R\$ $packagePrice',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            Expanded(
              // color: Colors.amber,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF41A852),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    reservationButtonText,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
