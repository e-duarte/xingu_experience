import 'package:flutter/material.dart';

typedef CircleButtonCallback = void Function();

class CircleButton extends StatelessWidget {
  const CircleButton({
    required this.iconPath,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final String iconPath;
  final CircleButtonCallback callback;

  final double containerSize = 43;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {
            callback();
          },
          clipBehavior: Clip.antiAlias,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(7),
            backgroundColor: Color(0xFF41A852), // <-- Button color
          ),
          child: Image.asset(
            iconPath,
          ),
        ),
        width: containerSize,
        height: containerSize,
      ),
    );
  }
}
