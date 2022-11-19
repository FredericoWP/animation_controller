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
          title: Text(
              "Container ${widget.index < 10 ? '0${widget.index}' : widget.index}"),
        ),
        ClipRRect(
          child: Align(
            heightFactor: sizeContainerAnimation.value,
            alignment: Alignment.topCenter,
            child: SizedBox(
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
