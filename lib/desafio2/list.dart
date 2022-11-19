import 'dart:math';

import 'package:flutter/material.dart';

class ListExpansiveContainer extends StatefulWidget {
  const ListExpansiveContainer({super.key, required this.index});
  final int index;

  @override
  State<ListExpansiveContainer> createState() => _ListExpansiveContainerState();
}

class _ListExpansiveContainerState extends State<ListExpansiveContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controllerAnimation;
  late Animation<double> sizeContainerAnimation;
  late Animation<double> rotationAnimation;
  late Animation<Color?> colorAnimation;
  late Animation<Color?> textColorAnimation;

  @override
  void initState() {
    super.initState();

    controllerAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    controllerAnimation.addListener(() => setState(() {}));

    sizeContainerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controllerAnimation,
        curve: Curves.ease,
      ),
    );

    rotationAnimation = Tween<double>(begin: 0.0, end: pi / 2).animate(
      CurvedAnimation(
        parent: controllerAnimation,
        curve: Curves.linear,
      ),
    );

    colorAnimation = ColorTween(begin: Colors.white, end: Colors.green)
        .animate(controllerAnimation);

    textColorAnimation = ColorTween(begin: Colors.grey, end: Colors.white)
        .animate(controllerAnimation);
  }

  void _animation() {
    if (controllerAnimation.isCompleted) {
      controllerAnimation.reverse();
    } else {
      controllerAnimation.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => _animation(),
          textColor: textColorAnimation.value,
          iconColor: textColorAnimation.value,
          tileColor: colorAnimation.value,
          title: Text(
              "Container ${widget.index < 10 ? '0${widget.index}' : widget.index}"),
          trailing: Transform.rotate(
            angle: rotationAnimation.value,
            child: const Icon(
              Icons.arrow_drop_down,
            ),
          ),
        ),
        ClipRRect(
          child: Align(
            heightFactor: sizeContainerAnimation.value,
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: const [
                  FlutterLogo(),
                  Text(
                      "Flutterando is the largest Flutter community in Brazil. Think about Flutter, think about Flutterando. Be part of our community!"),
                ],
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
