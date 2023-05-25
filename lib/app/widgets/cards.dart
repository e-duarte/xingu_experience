import 'package:flutter/material.dart';
import 'package:xingu_experience/app/widgets/buttons.dart';
import 'package:xingu_experience/app/widgets/evaluation.dart';

typedef CardButtonCallback = void Function();

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.coverPhoto,
    required this.callback,
  });

  final String title;
  final String subtitle;
  final String coverPhoto;
  final CardButtonCallback callback;

  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height * 0.35;
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: cardHeight,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          image: DecorationImage(
            image: NetworkImage(coverPhoto),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ReadMoreButton(
                    backgroundColor: 0xFFFFFFFF,
                    fontColor: 0xFF000000,
                    callback: callback,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  const PackageCard({
    required this.coverPhoto,
    required this.title,
    required this.evaluation,
    required this.organizer,
    required this.price,
    required this.callback,
    super.key,
  });

  final String coverPhoto;
  final String title;
  final int evaluation;
  final String organizer;
  final double price;
  final CardButtonCallback callback;

  final double rightPadding = 15;
  final double leftPadding = 15;
  final double topPadding = 10;
  final double bottomPadding = 15;

  @override
  Widget build(BuildContext context) {
    final double cardHeight = MediaQuery.of(context).size.height * 0.2;
    final double cardWidth = MediaQuery.of(context).size.width * 0.43;

    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        padding: EdgeInsets.only(
          right: rightPadding,
          left: leftPadding,
          bottom: bottomPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: cardHeight,
              width: cardWidth,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(coverPhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Evaluation(evaluationPoints: evaluation),
                  Text(organizer),
                  Text(
                    'a partir de R\$ $price',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
