import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  const Star({
    required this.active,
    super.key,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.height * 0.02;
    final spaceWidth = MediaQuery.of(context).size.height * 0.01;
    final containerHeight = MediaQuery.of(context).size.height * 0.02;
    return Row(
      children: [
        Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: active ? Colors.amber : Colors.white,
            shape: BoxShape.circle,
            border: active
                ? Border.all(color: Colors.amber)
                : Border.all(color: Colors.black),
          ),
        ),
        SizedBox(
          width: spaceWidth,
        )
      ],
    );
  }
}

class Evaluation extends StatelessWidget {
  const Evaluation({
    required this.evaluationPoints,
    super.key,
  });

  final int evaluationPoints;
  final int maxPoints = 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < evaluationPoints; i++) const Star(active: true),
        for (var i = 0; i < maxPoints - evaluationPoints; i++)
          const Star(active: false),
      ],
    );
  }
}
