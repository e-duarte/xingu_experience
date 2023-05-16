import 'dart:ffi';
import 'dart:ui';

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
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
              backgroundColor:
                  MaterialStateProperty.all(Color(backgroundColor)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconPath,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
              ],
            )),
        // width: width,
        height: height,
      ),
    );
  }
}
