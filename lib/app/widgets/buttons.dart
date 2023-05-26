import 'package:flutter/material.dart';

typedef AdditionalServiceButtonCallback = void Function();

class AdditionalServiceButton extends StatelessWidget {
  const AdditionalServiceButton({
    required this.iconPath,
    required this.text,
    required this.backgroundColor,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final String iconPath;
  final String text;
  final int backgroundColor;
  final AdditionalServiceButtonCallback callback;

  final double width = 110;
  final double height = 32;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // width: width,
        height: height,
        child: ElevatedButton(
            onPressed: () {
              callback();
            },
            clipBehavior: Clip.antiAlias,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(5)),
              backgroundColor:
                  MaterialStateProperty.all(Color(backgroundColor)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconPath,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                ),
              ],
            )),
      ),
    );
  }
}

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
        width: containerSize,
        height: containerSize,
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
      ),
    );
  }
}

typedef ReadMoreButtonCallback = void Function();

class ReadMoreButton extends StatelessWidget {
  const ReadMoreButton({
    required this.backgroundColor,
    required this.fontColor,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final int backgroundColor;
  final int fontColor;
  final ReadMoreButtonCallback callback;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {
            callback();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
            backgroundColor: MaterialStateProperty.all(Color(backgroundColor)),
          ),
          child: Text(
            'Leia mais',
            style: TextStyle(
              fontSize: 16,
              color: Color(fontColor),
            ),
          ),
        ),
        // width: containerSize,
        // height: containerSize,
      ),
    );
  }
}
