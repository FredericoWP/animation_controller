import 'package:flutter/material.dart';

class ContainerAnimation extends StatelessWidget {
  const ContainerAnimation({
    super.key,
    required this.controller,
    required this.alignmAnimation,
    required this.borderAnimation,
    required this.sizeAnimation,
    required this.onTap,
    required this.colorAnimation,
  });
  final AnimationController controller;
  final Animation<Alignment> alignmAnimation;
  final Animation<double> sizeAnimation;
  final Animation<double> borderAnimation;
  final Animation<Color?> colorAnimation;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Align(
        alignment: alignmAnimation.value,
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          width: sizeAnimation.value,
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius: BorderRadius.circular(borderAnimation.value),
          ),
        ),
      ),
    );
  }
}
