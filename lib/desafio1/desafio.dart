import 'package:animation_2022_11_19/desafio1/container.dart';
import 'package:flutter/material.dart';

class DesafioContainer extends StatefulWidget {
  const DesafioContainer({super.key});

  @override
  State<DesafioContainer> createState() => _DesafioContainerState();
}

class _DesafioContainerState extends State<DesafioContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<double> borderAnimation;
  late Animation<Alignment> alignmAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    controller.addListener(() => setState(() {}));

    sizeAnimation = Tween<double>(begin: 50, end: 150).animate(controller);
    borderAnimation = Tween<double>(begin: 30, end: 0).animate(controller);
    alignmAnimation =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topCenter)
            .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container Animado"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/d02');
              },
              icon: const Icon(Icons.change_circle))
        ],
      ),
      body: SafeArea(
        child: ContainerAnimation(
          controller: controller,
          alignmAnimation: alignmAnimation,
          borderAnimation: borderAnimation,
          sizeAnimation: sizeAnimation,
        ),
      ),
    );
  }
}
