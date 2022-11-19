import 'package:animation_2022_11_19/desafio2/list.dart';
import 'package:flutter/material.dart';

class ExpansiveContainer extends StatefulWidget {
  const ExpansiveContainer({super.key});

  @override
  State<ExpansiveContainer> createState() => _ExpansiveContainerState();
}

class _ExpansiveContainerState extends State<ExpansiveContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("ExpansiveContainer"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/d01');
              },
              icon: const Icon(Icons.change_circle),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: List.generate(
            50,
            (index) => ListExpansiveContainer(
              index: index,
            ),
          ),
        ));
  }
}
