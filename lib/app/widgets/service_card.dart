import 'package:flutter/material.dart';
import 'package:xingu_experience/app/widgets/buttons.dart';

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
