import 'package:flutter/material.dart';

class TabsView extends StatelessWidget {
  const TabsView(
      {Key? key,
      required this.tabIndex,
      required this.firstTab,
      required this.secondTab})
      : super(key: key);

  final int tabIndex;
  final Widget firstTab;
  final Widget secondTab;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          transform: Matrix4.translationValues(
              tabIndex == 0 ? 0 : -MediaQuery.of(context).size.width, 0, 0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: firstTab,
        ),
        AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          transform: Matrix4.translationValues(
              tabIndex == 1 ? 0 : MediaQuery.of(context).size.width, 0, 0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: secondTab,
        )
      ],
    );
  }
}
