import 'package:flutter/material.dart';

class ContainerAnimation extends StatelessWidget {
  const ContainerAnimation(
      {super.key,
      required this.controller,
      required this.alignmAnimation,
      required this.borderAnimation,
      required this.sizeAnimation});
  final AnimationController controller;
  final Animation<Alignment> alignmAnimation;
  final Animation<double> sizeAnimation;
  final Animation<double> borderAnimation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.isCompleted) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
      child: Align(
        alignment: alignmAnimation.value,
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          width: sizeAnimation.value,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(borderAnimation.value),
          ),
        ),
      ),
    );
  }
}
